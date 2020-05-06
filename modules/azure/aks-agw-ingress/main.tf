###
#  module composition
###

data "azurerm_client_config" "current" {
}

#resource group

module "resource_group" {
  source          = "../../../resources/azurerm/resource_group"
  service_name = "aks"
  region          = var.region
  environment     = var.environment
}

#network

module "subnet" {
  source                = "../../../resources/azurerm/network/subnet"
  vnet_name             = var.vnet_name
  resource_group        = var.vnet_rg
  name_prefixes           = ["snet-agw", "snet-aks"]
  subnet_address_prefixes = var.subnet_address_prefixes
}

module "public_ip_agw" {
  source            = "../../../resources/azurerm/network/public-ip"
  name              = "${module.resource_group.resource_group_name}-app-gw-ip"
  resource_group    = module.resource_group.resource_group_name
  allocation_method = "Static"
  sku               = "Standard"
}

#managed identity for aks

module "user_assigned_identity" {
  source         = "../../../resources/azurerm/governance/user_assigned_identity"
  resource_group = module.aks_cluster.node_resource_group
  uai_name       = "aks-id-${var.environment}-${module.resource_group.location}"
}

#role assignments for AD integration

module "role_assignment_aks_0" {
  source               = "../../../resources/azurerm/governance/role_assignment"
  scope                = module.subnet_aks.subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

module "role_assignment_aks_1" {
  source               = "../../../resources/azurerm/governance/role_assignment"
  scope                = module.user_assigned_identity_aks.uai_id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_client_config.current.object_id
}

module "role_assignment_aks_2" {
  source               = "../../../resources/azurerm/governance/role_assignment"
  scope                = module.subnet_agw.subnet_id
  role_definition_name = "Contributor"
  principal_id         = module.aks_user_assigned_identity.uai_principal_id
}

module "role_assignment_aks_3" {
  source               = "../../../resources/azurerm/governance/role_assignment"
  scope                = module.resource_group.resource_group_id
  role_definition_name = "Reader"
  principal_id         = module.aks_user_assigned_identity.uai_principal_id
}

#agw

module "application_gateway" {
  source               = "../../../resources/azurerm/network/application_gateway"
  resource_group       = module.resource_group.resource_group_name
  name_prefix          = "agw-aks"
  sku_name             = "WAF_v2"
  sku_tier             = "WAF_v2"
  subnet_id            = module.subnet.subnet_id
  public_ip_address_id = module.public_ip.public_ip_id
  tags                 = var.tags
}

#aks cluster

module "subnet" {
  source                = "../../../resources/azurerm/network/subnet"
  vnet_name             = var.vnet_name
  resource_group        = var.vnet_rg
  name_prefix           = "snet-aks-nodes"
  subnet_address_prefix = var.subnet_aks_nodes_address_prefix
}

module "aks" {
  source         = "../../../resources/azurerm/containers/kubernetes_cluster"
  resource_group = module.resource_group.resource_group_name
  client_id      = data.azurerm_client_config.current.client_id
  client_secret  = var.client_secret
  agent_pool_profile = [
    {
      name                = "default"
      count               = "1"
      vm_size             = "Standard_B2s"
      availability_zones  = null
      enable_auto_scaling = "true"
      min_count           = "1"
      max_count           = "2"
      max_pods            = null
      os_disk_size_gb     = "60"
      os_type             = "Linux"
      type                = "VirtualMachineScaleSets"
      vnet_subnet_id      = module.aks_subnet.subnet_id
      node_taints         = null
    },
  ]
  network_profile = [
    {
      network_plugin     = "azure"
      dns_service_ip     = var.dns_service_ip
      docker_bridge_cidr = var.docker_bridge_cidr
      service_cidr       = var.service_cidr
      subnet_id          = module.aks_subnet.subnet_id
      pod_cidr           = null
      load_balancer_sku  = null
    },
  ]
  tags = var.tags
}

#aapodidentity for ARM integration

resource "null_resource" "aks_config" {
  depends_on = [module.aks_cluster]
  provisioner "local-exec" {
    command = <<EOT
    az login --service-principal -u ${data.azurerm_client_config.current.client_id} -p ${var.client_secret} --tenant ${data.azurerm_client_config.current.tenant_id};
    az aks get-credentials --resource-group ${module.resource_group.resource_group_name} --name ${module.resource_group.resource_group_name}-aks-cluster --admin --overwrite-existing;
    kubectl create -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment.yaml;
    echo "${templatefile("${path.module}/templates/aadpodidentity.yaml", {
    name                 = module.aks_user_assigned_identity.uai_name,
    identity_resource_id = module.aks_user_assigned_identity.uai_id,
    identity_client_id   = module.aks_user_assigned_identity.uai_client_id
})}" | kubectl apply -f -
    EOT
}
}

#authentication for helm provider

provider "helm" {
  kubernetes {
    host                   = module.aks_cluster.kube_config_host
    client_certificate     = base64decode(module.aks_cluster.kube_config_client_certificate)
    client_key             = base64decode(module.aks_cluster.kube_config_client_key)
    cluster_ca_certificate = base64decode(module.aks_cluster.kube_config_cluster_ca_certificate)
  }
}

#helm release for waf-ingress

resource "helm_release" "ingress-azure" {
  depends_on = [null_resource.aks_config]
  name       = "application-gateway-kubernetes-ingress"
  repository = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
  chart      = "ingress-azure"
  namespace  = "default"

  values = [
    "${templatefile("${path.module}/templates/helm-config.yaml", {
      subscription_id         = data.azurerm_client_config.current.subscription_id,
      resource_group_name     = module.resource_group.resource_group_name,
      applicationgateway_name = "${module.resource_group.resource_group_name}-app-gw",
      identity_resource_id    = module.aks_user_assigned_identity.uai_id,
      identity_client_id      = module.aks_user_assigned_identity.uai_client_id,
      aks-api-server-address  = module.aks_cluster.fqdn
    })}"
  ]
}

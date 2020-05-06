###
#  module composition
###

data "azurerm_client_config" "current" {
}

#resource group

module "resource_group" {
  source          = "../../../resources/azurerm/base/resource_group"
  service_name = "aks"
  region          = var.region
  environment     = var.environment
}

#managed identity for aks

module "user_assigned_identity" {
  source         = "../../../resources/azurerm/authorization/user_assigned_identity"
  resource_group = module.resource_group.name
  name_prefix       = "uai-aks"
  environment     = var.environment
}

#role assignments for AD integration

module "role_assignment_aks_0" {
  source               = "../../../resources/azurerm/authorization/role_assignment"
  scope                = var.subnet_id_aks
  role_definition_name = "Network Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

module "role_assignment_aks_1" {
  source               = "../../../resources/azurerm/authorization/role_assignment"
  scope                = module.user_assigned_identity.uai_id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_client_config.current.object_id
}

module "role_assignment_aks_2" {
  source               = "../../../resources/azurerm/authorization/role_assignment"
  scope                = var.subnet_id_agw
  role_definition_name = "Contributor"
  principal_id         = module.user_assigned_identity.uai_principal_id
}

module "role_assignment_aks_3" {
  source               = "../../../resources/azurerm/authorization/role_assignment"
  scope                = module.resource_group.id
  role_definition_name = "Reader"
  principal_id         = module.user_assigned_identity.uai_principal_id
}

#agw

module "public_ip" {
  source            = "../../../resources/azurerm/network/public_ip"
  name_prefix       = "pip-agw"
  resource_group    = module.resource_group.name
  allocation_method = "Static"
  sku               = "Standard"
  environment     = var.environment
}

module "application_gateway" {
  source               = "../../../resources/azurerm/network/application_gateway"
  resource_group       = module.resource_group.name
  name_prefix          = "agw-aks"
  sku_name             = "Standard_v2"
  sku_tier             = "Standard_v2"
  subnet_id            = var.subnet_id_agw
  public_ip_address_id = module.public_ip.id
  environment     = var.environment
  tags                 = var.tags
}

#aks

module "aks" {
  source         = "../../../resources/azurerm/container/kubernetes_cluster"
  resource_group = module.resource_group.name
  vm_size             = "Standard_B2s"
  node_count = 3
  vnet_subnet_id      = var.subnet_id_aks
  network_profile = [
    {
      network_plugin     = "azure"
      network_policy     = null
      dns_service_ip     = var.dns_service_ip
      docker_bridge_cidr = var.docker_bridge_cidr
      service_cidr       = var.service_cidr
      subnet_id          = var.subnet_id_aks
      pod_cidr           = null
      load_balancer_sku  = null
      load_balancer_profile = null
      managed_outbound_ip_count = null
      outbound_type = null
      managed_outbound_ip_count = null
      outbound_ip_prefix_ids = null
      outbound_ip_address_ids = null
    }
  ]
  tags = var.tags
  environment     = var.environment
}

#aapodidentity for ARM integration

resource "null_resource" "aks_config" {
  depends_on = [module.aks]
  provisioner "local-exec" {
    command = <<EOT
    az login --service-principal -u ${data.azurerm_client_config.current.client_id} -p ${var.client_secret} --tenant ${data.azurerm_client_config.current.tenant_id};
    az aks get-credentials --resource-group ${module.resource_group.name} --name ${module.aks.name} --admin --overwrite-existing;
    kubectl create -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment.yaml;
    echo "${templatefile("${path.module}/templates/aadpodidentity.yaml", {
    name                 = module.user_assigned_identity.uai_name,
    identity_resource_id = module.user_assigned_identity.uai_id,
    identity_client_id   = module.user_assigned_identity.uai_client_id
})}" | kubectl apply -f -
    EOT
}
}

#authentication for helm provider

provider "helm" {
  kubernetes {
    host                   = module.aks.kube_config_host
    client_certificate     = base64decode(module.aks.kube_config_client_certificate)
    client_key             = base64decode(module.aks.kube_config_client_key)
    cluster_ca_certificate = base64decode(module.aks.kube_config_cluster_ca_certificate)
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
      resource_group_name     = module.resource_group.name,
      applicationgateway_name = module.application_gateway.name,
      identity_resource_id    = module.user_assigned_identity.uai_id,
      identity_client_id      = module.user_assigned_identity.uai_client_id,
      aks-api-server-address  = module.aks.fqdn
    })}"
  ]
}

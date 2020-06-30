###
#  module composition
###

data "azurerm_client_config" "current" {
}

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "aks"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

#managed identity for aks

module "user_assigned_identity" {
  source         = "../../resources/authorization/user_assigned_identity"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  name_prefix    = "mi-aks"
  environment    = var.environment
}

#role assignments for AD integration

module "role_assignment_aks_0" {
  source               = "../../resources/authorization/role_assignment"
  scope                = element(module.subnet.id, 1)
  role_definition_name = "Network Contributor"
  principal_id         = var.object_id
}

module "role_assignment_aks_1" {
  source               = "../../resources/authorization/role_assignment"
  scope                = module.user_assigned_identity.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = var.object_id
}

module "role_assignment_aks_2" {
  source               = "../../resources/authorization/role_assignment"
  scope                = module.application_gateway.id
  role_definition_name = "Contributor"
  principal_id         = module.user_assigned_identity.principal_id
}

module "role_assignment_aks_3" {
  source               = "../../resources/authorization/role_assignment"
  scope                = module.resource_group.id
  role_definition_name = "Reader"
  principal_id         = module.user_assigned_identity.principal_id
}

#subnet

module "subnet" {
  source               = "../../resources/network/subnet"
  resource_group       = var.virtual_network_resource_group
  region               = module.resource_group.location
  virtual_network_name = var.virtual_network_name
  name_prefixes        = ["snet-agw", "snet-aks"]
  address_prefixes     = concat(var.address_prefix_agw, var.address_prefix_aks)
  environment          = var.environment
}

#agw

module "public_ip" {
  source            = "../../resources/network/public_ip"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  environment       = var.environment
  name_prefix       = "pip-agw"
  allocation_method = "Static"
  sku               = "Standard"
  tags              = var.tags
}

module "application_gateway" {
  source               = "../../resources/network/application_gateway"
  resource_group       = module.resource_group.name
  region               = module.resource_group.location
  name_prefix          = "agw-aks"
  sku_name             = "Standard_v2"
  sku_tier             = "Standard_v2"
  subnet_id            = element(module.subnet.id, 0)
  public_ip_address_id = module.public_ip.id
  environment          = var.environment
  tags                 = var.tags
}

#aks

module "aks" {
  source         = "../../resources/container/kubernetes_cluster"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  environment    = var.environment
  vm_size        = var.vm_size
  node_count     = var.node_count
  vnet_subnet_id = element(module.subnet.id, 1)
  service_principal = [{
    client_id     = var.app_id
    client_secret = var.client_secret
  }]
  network_profile = [
    {
      network_plugin     = "azure"
      network_policy     = null
      dns_service_ip     = var.dns_service_ip
      docker_bridge_cidr = var.docker_bridge_cidr
      outbound_type      = null
      pod_cidr           = null
      service_cidr       = var.service_cidr
      load_balancer_sku  = "Basic"
    }
  ]
  tags = var.tags
}

#aapodidentity for ARM integration

resource "null_resource" "aks_config" {
  depends_on = [module.aks]
  provisioner "local-exec" {
    command = <<EOT
    az aks get-credentials --resource-group ${module.resource_group.name} --name ${module.aks.name} --admin --overwrite-existing;
    kubectl create -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment.yaml;
    echo "${templatefile("${path.module}/templates/aadpodidentity.yaml", {
    name                 = module.user_assigned_identity.name,
    identity_resource_id = module.user_assigned_identity.id,
    identity_client_id   = module.user_assigned_identity.client_id
    })}" | kubectl apply -f -;
    echo "${templatefile("${path.module}/templates/aadpodbinding.yaml", {
    name = module.user_assigned_identity.name
})}" | kubectl apply -f -
    EOT
}
}

#authentication for helm provider

provider "helm" {
  kubernetes {
    load_config_file       = false
    host                   = module.aks.kube_config_host
    client_certificate     = base64decode(module.aks.kube_config_client_certificate)
    client_key             = base64decode(module.aks.kube_config_client_key)
    cluster_ca_certificate = base64decode(module.aks.kube_config_cluster_ca_certificate)
  }
}

#helm release for ingress-azure

resource "helm_release" "ingress_azure" {
  depends_on = [null_resource.aks_config]
  name       = "application-gateway-kubernetes"
  repository = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
  chart      = "ingress-azure"
  version    = "1.2.0-rc1"

  values = [
    "${templatefile("${path.module}/templates/helm-config.yaml", {
      subscription_id         = data.azurerm_client_config.current.subscription_id,
      resource_group_name     = module.resource_group.name,
      applicationgateway_name = module.application_gateway.name,
      identity_resource_id    = module.user_assigned_identity.id,
      identity_client_id      = module.user_assigned_identity.client_id,
      aks-api-server-address  = module.aks.fqdn
    })}"
  ]
}

#deploy test app
resource "null_resource" "aks_test_app" {
  depends_on = [helm_release.ingress_azure]
  provisioner "local-exec" {
    command = <<EOT
    az aks get-credentials --resource-group ${module.resource_group.name} --name ${module.aks.name} --admin --overwrite-existing;
    kubectl apply -f ${path.module}/templates/aspnetapp.yaml
    EOT    
  }
}
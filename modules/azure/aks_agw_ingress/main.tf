###
#  module composition
###

data "azurerm_client_config" "current" {
}

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "aks"
  region       = var.region
  environment  = var.environment
}

#managed identity for aks

module "user_assigned_identity" {
  source         = "../../../resources/azurerm/authorization/user_assigned_identity"
  resource_group = module.resource_group.name
  name_prefix    = "mi-aks"
  environment    = var.environment
}

#role assignments for AD integration

module "role_assignment_aks_0" {
  source               = "../../../resources/azurerm/authorization/role_assignment"
  scope                = var.subnet_id_aks
  role_definition_name = "Network Contributor"
  principal_id         = var.object_id
}

module "role_assignment_aks_1" {
  source               = "../../../resources/azurerm/authorization/role_assignment"
  scope                = module.user_assigned_identity.uai_id
  role_definition_name = "Managed Identity Operator"
  principal_id         = var.object_id
}

module "role_assignment_aks_2" {
  source               = "../../../resources/azurerm/authorization/role_assignment"
  scope                = module.application_gateway.id
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
  environment       = var.environment
}

module "application_gateway" {
  source               = "../../../resources/azurerm/network/application_gateway"
  resource_group       = module.resource_group.name
  name_prefix          = "agw-aks"
  sku_name             = "Standard_v2"
  sku_tier             = "Standard_v2"
  subnet_id            = var.subnet_id_agw
  public_ip_address_id = module.public_ip.id
  environment          = var.environment
  tags                 = var.tags
}

#aks

module "aks" {
  source         = "../../../resources/azurerm/container/kubernetes_cluster"
  resource_group = module.resource_group.name
  vm_size        = "Standard_B2s"
  node_count     = 3
  vnet_subnet_id = var.subnet_id_aks
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
  tags        = var.tags
  environment = var.environment
}

#aapodidentity for ARM integration
//az login --service-principal -u ${var.app_id} -p ${var.client_secret} --tenant ${data.azurerm_client_config.current.tenant_id};
//    echo "${templatefile("${path.module}/templates/aadpodidentity.yaml", {
//    name                 = module.user_assigned_identity.uai_name,
//    identity_resource_id = module.user_assigned_identity.uai_id,
//    identity_client_id   = module.user_assigned_identity.uai_client_id
//})}" | kubectl apply -f -

resource "null_resource" "aks_config" {
  depends_on = [module.aks]
  provisioner "local-exec" {
    command = <<EOT
    az aks get-credentials --resource-group ${module.resource_group.name} --name ${module.aks.name} --admin --overwrite-existing;
    kubectl create -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment.yaml;
    echo "${templatefile("${path.module}/templates/aadpodidentity.yaml", {
    name                 = module.user_assigned_identity.uai_name,
    identity_resource_id = module.user_assigned_identity.uai_id,
    identity_client_id   = module.user_assigned_identity.uai_client_id
    })}" | kubectl apply -f -;
    echo "${templatefile("${path.module}/templates/aadpodbinding.yaml", {
    name = module.user_assigned_identity.uai_name
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

#helm release for ingress-azure

data "helm_repository" "ingress_azure" {
  name = "application-gateway-kubernetes-ingress"
  url  = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
}

resource "helm_release" "ingress_azure" {
  depends_on = [null_resource.aks_config]
  name       = "application-gateway-kubernetes"
  repository = data.helm_repository.ingress_azure.metadata[0].name
  chart      = "ingress-azure"

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

#deploy test app
resource "null_resource" "aks_test_app" {
  depends_on = [helm_release.ingress_azure]
  provisioner "local-exec" {
    command = "kubectl apply -f ${path.module}/templates/aspnetapp.yaml"
  }
}
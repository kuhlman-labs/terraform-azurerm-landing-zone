data "azurerm_client_config" "current" {
}

# Setting up resource group

module "resource_group" {
  source          = "../../../resources/azure/resource-group"
  resource_prefix = "k8s"
  region          = var.region
  environment     = var.environment
}

#Setting up aks managed identity

module "aks_user_assigned_identity" {
  source         = "../../../resources/azure/governance/user-assigned-identity"
  resource_group = module.aks_cluster.aks_node_resource_group
  uai_name       = "aks-cluster-id"
}

#Setting up role assignments for AD integration

module "aks_role_assignment_1" {
  source               = "../../../resources/azure/governance/role-assignment"
  scope                = module.aks_subnet.subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = data.azurerm_client_config.current.service_principal_object_id
}

module "aks_role_assignment_2" {
  source               = "../../../resources/azure/governance/role-assignment"
  scope                = module.aks_user_assigned_identity.uai_id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_client_config.current.service_principal_object_id
}

module "aks_role_assignment_3" {
  source               = "../../../resources/azure/governance/role-assignment"
  scope                = module.waf_subnet.subnet_id
  role_definition_name = "Contributor"
  principal_id         = module.aks_user_assigned_identity.uai_principal_id
}

module "aks_role_assignment_4" {
  source               = "../../../resources/azure/governance/role-assignment"
  scope                = module.resource_group.resource_group_id
  role_definition_name = "Reader"
  principal_id         = module.aks_user_assigned_identity.uai_principal_id
}

#Setting up WAF

module "waf_subnet" {
  source                = "../../../resources/azure/network/vnet-subnet"
  vnet_name             = var.vnet_name
  resource_group        = var.vnet_rg
  subnet_name           = "app_gw"
  subnet_address_prefix = var.subnet_app_gw_address_prefix
}

module "waf_public_ip" {
  source            = "../../../resources/azure/network/public-ip"
  name              = "${module.resource_group.resource_group_name}-app-gw-ip"
  resource_group    = module.resource_group.resource_group_name
  allocation_method = "Static"
  sku               = "Standard"
}

module "waf" {
  source               = "../../../resources/azure/network/application-gateway"
  resource_group       = module.resource_group.resource_group_name
  sku_name             = "WAF_v2"
  sku_tier             = "WAF_v2"
  subnet_id            = module.waf_subnet.subnet_id
  public_ip_address_id = module.waf_public_ip.public_ip_id
  tags                 = var.tags
}

#Setting up AKS Cluster

module "aks_subnet" {
  source                = "../../../resources/azure/network/vnet-subnet"
  vnet_name             = var.vnet_name
  resource_group        = var.vnet_rg
  subnet_name           = "aks_nodes"
  subnet_address_prefix = var.subnet_aks_nodes_address_prefix
}

module "aks_cluster" {
  source         = "../../../resources/azure/containers/aks-cluster"
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

#Setting up aapodidentity for ARM integration

resource "null_resource" "aks_config" {
  depends_on = [module.aks_cluster]
  provisioner "local-exec" {
    command = <<EOT
    az login --service-principal -u ${data.azurerm_client_config.current.client_id} -p ${var.client_secret} --tenant ${data.azurerm_client_config.current.tenant_id};
    az aks get-credentials --resource-group ${module.resource_group.resource_group_name} --name ${module.resource_group.resource_group_name}-aks-cluster --admin --overwrite-existing;
    kubectl create -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment.yaml;
    echo "${templatefile("${path.module}/aadpodidentity.yaml", {
      name = module.aks_user_assigned_identity.uai_name,
      identity_resource_id = module.aks_user_assigned_identity.uai_id,
      identity_client_id = module.aks_user_assigned_identity.uai_client_id
    })}" | kubectl apply -f -
    EOT
      }
      }

      #Setting up authentication for helm provider

      provider "helm" {
        kubernetes {
          host                   = "${module.aks_cluster.aks_kube_config_host}"
          client_certificate     = "${base64decode(module.aks_cluster.aks_kube_config_client_certificate)}"
          client_key             = "${base64decode(module.aks_cluster.aks_kube_config_client_key)}"
          cluster_ca_certificate = "${base64decode(module.aks_cluster.aks_kube_config_cluster_ca_certificate)}"
        }
      }

      #setting up helm release for waf-ingress

      resource "helm_release" "ingress-azure" {
        depends_on = [null_resource.aks_config]
        name       = "application-gateway-kubernetes-ingress"
        repository = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
        chart      = "ingress-azure"
        namespace  = "default"

        values = [
          "${templatefile("${path.module}/helm-config.yaml", {
            subscription_id         = data.azurerm_client_config.current.subscription_id,
            resource_group_name     = module.resource_group.resource_group_name,
            applicationgateway_name = "${module.resource_group.resource_group_name}-app-gw",
            identity_resource_id    = module.aks_user_assigned_identity.uai_id,
            identity_client_id      = module.aks_user_assigned_identity.uai_client_id,
            aks-api-server-address  = module.aks_cluster.aks_fqdn
          })}"
        ]
      }

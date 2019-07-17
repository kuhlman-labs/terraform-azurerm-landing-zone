#Pulling in outputs form shared-services stack for firewall ip

data "terraform_remote_state" "shared_services" {
  backend = "azurerm"

  config = {
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.shared_state_key
    access_key           = var.access_key
  }
}

data "azurerm_subscription" "current" {
}

###########################
# Setting up resource group
###########################

module "resource_group" {
  source          = "../../resource-modules/resource-group"
  resource_prefix = "k8s"
  region          = var.region
  environment     = var.environment
}

#Setting up aks managed identity

module "aks_user_assigned_identity" {
  source         = "../../resource-modules/governance/user-assigned-identity"
  resource_group = module.aks_cluster.aks_node_resource_group
  uai_name       = "aks-cluster-id"
}

#Setting up role assignments for AD integration

module "aks_role_assignment_1" {
  source               = "../../resource-modules/governance/role-assignment"
  scope                = data.terraform_remote_state.shared_services.outputs.shared_services_subnet_app_gw_id
  role_definition_name = "Network Contributor"
  principal_id         = var.aks_server_object_id
}

module "aks_role_assignment_2" {
  source               = "../../resource-modules/governance/role-assignment"
  scope                = module.aks_user_assigned_identity.uai_id
  role_definition_name = "Managed Identity Operator"
  principal_id         = var.aks_server_object_id
}

module "aks_role_assignment_3" {
  source               = "../../resource-modules/governance/role-assignment"
  scope                = data.terraform_remote_state.shared_services.outputs.shared_services_appgw_id
  role_definition_name = "Contributor"
  principal_id         = module.aks_user_assigned_identity.uai_principal_id
}

module "aks_role_assignment_4" {
  source               = "../../resource-modules/governance/role-assignment"
  scope                = module.resource_group.resource_group_id
  role_definition_name = "Reader"
  principal_id         = module.aks_user_assigned_identity.uai_principal_id
}

#Setting up WAF

module "waf_public_ip" {
  source            = "../../resource-modules/network/public-ip"
  name              = "${module.resource_group.resource_group_name}-app-gw-ip"
  resource_group    = module.resource_group.resource_group_name
  allocation_method = "Static"
}


module "waf" {
  source               = "../../resource-modules/network/application-gateway"
  resource_group       = module.resource_group.resource_group_name
  sku_name             = "WAF_v2"
  sku_tier             = "WAF_v2"
  subnet_id            = var.appgw_subnet_id
  public_ip_address_id = module.waf_public_ip.public_ip_id
  tags                 = var.tags
}

#Setting up AKS Cluster

module "aks_cluster" {
  source                          = "../../resource-modules/containers/aks-cluster"
  resource_group                  = module.resource_group.resource_group_name
  public_ssh_key_path             = "${path.module}/id_rsa.pub"
  aks_name                        = module.resource_group.resource_group_name
  aks_dns_prefix                  = "${module.resource_group.resource_group_name}-agents"
  aks_agent_type                  = var.aks_agent_type
  admin_user_name                 = var.admin_user_name
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  aks_subnet_id                   = var.aks_subnet_id
  aks_aci_subnet_name             = var.aks_aci_subnet_name
  aks_version                     = var.aks_version
  tenant_id                       = var.tenant_id
  api_server_authorized_ip_ranges = concat(["${data.terraform_remote_state.shared_services.outputs.shared_services_firewall_public_ip}/32"], var.api_server_authorized_ip_ranges)
  aks_agent_count                 = var.aks_agent_count
  aks_agent_vm_size               = var.aks_agent_vm_size
  client_id                       = var.client_id
  client_secret                   = var.client_secret
  aks_client_id                   = var.aks_client_id
  aks_server_client_secret        = var.aks_server_client_secret
  aks_server_id                   = var.aks_server_id
  aks_dns_service_ip              = var.aks_dns_service_ip
  aks_docker_bridge_cidr          = var.aks_docker_bridge_cidr
  aks_service_cidr                = var.aks_service_cidr
  tags                            = var.tags
}

#Setting up aapodidentity for AD integration

resource "null_resource" "aks_status" {
  depends_on = ["module.aks_cluster"]
  provisioner "local-exec" {
    command = <<EOT
    az login --service-principal -u ${var.client_id} -p ${var.client_secret} --tenant ${var.tenant_id};
    az aks get-credentials --resource-group ${module.resource_group.resource_group_name} --name ${module.resource_group.resource_group_name}-aks-cluster --admin --overwrite-existing;
    kubectl create -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment-rbac.yaml;
    echo "${templatefile("${path.module}/aadpodidentity.yaml", {
      name = "aks-cluster-id",
      identity_resource_id = module.aks_user_assigned_identity.uai_id,
      identity_client_id = module.aks_user_assigned_identity.uai_client_id
    })}" | kubectl apply -f -
    EOT
      }
      }

      #Setting up authentication for kubernetes provider

      provider "kubernetes" {
        host = "${module.aks_cluster.aks_kube_admin_config_host}"
        #username               = "${module.aks_cluster.aks_kube_admin_config_username}"
        #password               = "${module.aks_cluster.aks_kube_admin_config_password}"
        client_certificate     = "${base64decode(module.aks_cluster.aks_kube_admin_config_client_certificate)}"
        client_key             = "${base64decode(module.aks_cluster.aks_kube_admin_config_client_key)}"
        cluster_ca_certificate = "${base64decode(module.aks_cluster.aks_kube_admin_config_cluster_ca_certificate)}"
      }

      #Setting up tiller sa for kubernetes cluster

      resource "kubernetes_service_account" "tiller_sa" {
        depends_on = [null_resource.aks_status]
        metadata {
          name      = "tiller"
          namespace = "kube-system"
        }
      }

      resource "kubernetes_cluster_role_binding" "tiller-cluster-rule" {
        metadata {
          name = "tiller-cluster-rule"
        }
        role_ref {
          api_group = "rbac.authorization.k8s.io"
          kind      = "ClusterRole"
          name      = "cluster-admin"
        }
        subject {
          kind      = "ServiceAccount"
          name      = kubernetes_service_account.tiller_sa.metadata.0.name
          namespace = "kube-system"
        }
      }

      #Setting up authentication for helm provider

      provider "helm" {
        service_account = "${kubernetes_service_account.tiller_sa.metadata.0.name}"
        kubernetes {
          host = "${module.aks_cluster.aks_kube_admin_config_host}"
          #username = "${module.aks_cluster.aks_kube_admin_config_username}"
          #password = "${module.aks_cluster.aks_kube_admin_config_password}"
          client_certificate     = "${base64decode(module.aks_cluster.aks_kube_admin_config_client_certificate)}"
          client_key             = "${base64decode(module.aks_cluster.aks_kube_admin_config_client_key)}"
          cluster_ca_certificate = "${base64decode(module.aks_cluster.aks_kube_admin_config_cluster_ca_certificate)}"
        }
      }

      #setting up helm release for waf-ingress

      resource "helm_release" "ingress-azure" {
        depends_on = [kubernetes_cluster_role_binding.tiller-cluster-rule]
        name       = "application-gateway-kubernetes-ingress"
        repository = "https://azure.github.io/application-gateway-kubernetes-ingress/helm/"
        chart      = "ingress-azure"
        namespace  = "default"

        values = [
          "${templatefile("${path.module}/helm-config.yaml", {
            subscription_id         = data.azurerm_subscription.current.subscription_id,
            resource_group_name     = data.terraform_remote_state.shared_services.outputs.shared_services_vnet_rg,
            applicationgateway_name = "${data.terraform_remote_state.shared_services.outputs.shared_services_vnet_rg}-app-gw",
            identity_resource_id    = module.aks_user_assigned_identity.uai_id,
            identity_client_id      = module.aks_user_assigned_identity.uai_client_id,
            aks-api-server-address  = module.aks_cluster.aks_fqdn
          })}"
        ]
      }

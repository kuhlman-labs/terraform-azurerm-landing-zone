#############################################################
# Setting up Infra Modules for AKS Cluster with a WAF Ingress
#############################################################

module "resource_group" {
  source          = "../../resource-modules/resource-group"
  resource_prefix = "AKS-CLUSTER"
  region          = var.region
  environment     = var.environment
}

module "aks_user_assigned_identity" {
  source         = "../../resource-modules/governance/user-assigned-identity"
  resource_group = module.resource_group.resource_group_name
  uai_name       = "aks-cluster-id"
}

module "aks_waf" {
  source            = "../../resource-modules/network/application-gateway"
  resource_group    = module.resource_group.resource_group_name
  appgw_vnet_name   = var.appgw_vnet_name
  appgw_name        = "${module.resource_group.resource_group_name}-WAF"
  appgw_sku         = "WAF_v2"
  appgw_tier        = "WAF_v2"
  appgw_subnet_id   = var.appgw_subnet_id
  approver_tag      = var.approver_tag
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  service_hours_tag = var.service_hours_tag
  optional_tags     = var.optional_tags
}

data "azurerm_client_config" "current" {}


module "aks_role_assignment_1" {
  source               = "../../resource-modules/governance/role-assignment"
  scope                = var.aks_subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = "1f88650c-a051-47a1-a704-d9ad8844de32"
}

module "aks_role_assignment_2" {
  source               = "../../resource-modules/governance/role-assignment"
  scope                = module.aks_user_assigned_identity.uai_id
  role_definition_name = "Managed Identity Operator"
  principal_id         = "1f88650c-a051-47a1-a704-d9ad8844de32"
}

module "aks_role_assignment_3" {
  source               = "../../resource-modules/governance/role-assignment"
  scope                = module.aks_waf.appgw_id
  role_definition_name = "Contributor"
  principal_id         = module.aks_user_assigned_identity.uai_principal_id
}

module "aks_role_assignment_4" {
  source               = "../../resource-modules/governance/role-assignment"
  scope                = module.resource_group.resource_group_id
  role_definition_name = "Reader"
  principal_id         = module.aks_user_assigned_identity.uai_principal_id
}

module "aks_cluster" {
  source                     = "../../resource-modules/containers/aks-cluster"
  resource_group             = module.resource_group.resource_group_name
  aks_name                   = module.resource_group.resource_group_name
  aks_dns_prefix             = "${module.resource_group.resource_group_name}-AGENTS"
  aks_agent_type             = var.aks_agent_type
  admin_user_name            = var.admin_user_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  aks_subnet_id              = var.aks_subnet_id
  aks_aci_subnet_name        = var.aks_aci_subnet_name
  aks_version                = var.aks_version
  tenant_id                  = var.tenant_id
  #api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  aks_agent_count          = var.aks_agent_count
  aks_agent_vm_size        = var.aks_agent_vm_size
  client_id                = var.client_id
  client_secret            = var.client_secret
  aks_client_id            = "01521c5e-7bed-47df-b89f-19cb344e6388"
  aks_server_client_secret = "pEbmEA1XWzDdB*g-?RhvQ7/Y9ti43oeA"
  aks_server_id            = "dff1eb98-81e3-4cb9-910c-6ecfa69c822c"
  aks_dns_service_ip       = var.aks_dns_service_ip
  aks_docker_bridge_cidr   = var.aks_docker_bridge_cidr
  aks_service_cidr         = var.aks_service_cidr
  approver_tag             = var.approver_tag
  owner_tag                = var.owner_tag
  region_tag               = var.region_tag
  cost_center_tag          = var.cost_center_tag
  service_hours_tag        = var.service_hours_tag
  optional_tags            = var.optional_tags
}

provider "kubernetes" {
  host = "${module.aks_cluster.aks_kube_admin_config_host}"
  #username               = "${module.aks_cluster.aks_kube_admin_config_username}"
  #password               = "${module.aks_cluster.aks_kube_admin_config_password}"
  client_certificate     = "${base64decode(module.aks_cluster.aks_kube_admin_config_client_certificate)}"
  client_key             = "${base64decode(module.aks_cluster.aks_kube_admin_config_client_key)}"
  cluster_ca_certificate = "${base64decode(module.aks_cluster.aks_kube_admin_config_cluster_ca_certificate)}"
}

resource "null_resource" "aks_status" {
  depends_on = ["module.aks_cluster"]
  provisioner "local-exec" {
    command = <<EOT
    az aks get-credentials --resource-group ${module.resource_group.resource_group_name} --name ${module.resource_group.resource_group_name} --admin --overwrite-existing;
    kubectl create -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment-rbac.yaml;
    echo "${templatefile("${path.module}/aadpodidentity.yaml", {
      name = "aks-cluster-id",
      identity_resource_id = module.aks_user_assigned_identity.uai_id,
      identity_client_id = module.aks_user_assigned_identity.uai_client_id
    })}" | kubectl apply -f -
    EOT
      }
      }

      resource "kubernetes_service_account" "tiller_sa" {
        depends_on = [null_resource.aks_status]
        metadata {
          name      = "tiller-sa"
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
          name      = "tiller-sa"
          namespace = "kube-system"
        }
        depends_on = [kubernetes_service_account.tiller_sa]
      }

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

      data "azurerm_subscription" "current" {}

      resource "helm_release" "ingress-azure" {
        depends_on = [kubernetes_cluster_role_binding.tiller-cluster-rule]
        name       = "application-gateway-kubernetes-ingress"
        repository = "https://azure.github.io/application-gateway-kubernetes-ingress/helm/"
        chart      = "ingress-azure"
        namespace  = "kube-system"

        values = [
          "${templatefile("${path.module}/helm-config.yaml", {
            subscription_id         = data.azurerm_subscription.current.subscription_id,
            resource_group_name     = module.resource_group.resource_group_name,
            applicationgateway_name = "${module.resource_group.resource_group_name}-WAF",
            identity_resource_id    = module.aks_user_assigned_identity.uai_id,
            identity_client_id      = module.aks_user_assigned_identity.uai_client_id,
            aks-api-server-address  = "${module.aks_cluster.aks_fqdn}"
          })}"
        ]
      }

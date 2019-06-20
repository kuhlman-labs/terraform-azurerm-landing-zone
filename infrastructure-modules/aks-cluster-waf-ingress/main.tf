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
  uai_name       = "aks_cluster"
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
  principal_id         = data.azurerm_client_config.current.service_principal_object_id
}

module "aks_role_assignment_2" {
  source               = "../../resource-modules/governance/role-assignment"
  scope                = module.aks_user_assigned_identity.uai_id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_client_config.current.service_principal_object_id
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
  source                          = "../../resource-modules/containers/aks-cluster"
  resource_group                  = module.resource_group.resource_group_name
  aks_name                        = module.resource_group.resource_group_name
  aks_dns_prefix                  = "${module.resource_group.resource_group_name}-DNS"
  admin_user_name                 = var.admin_user_name
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  aks_subnet_id                   = var.aks_subnet_id
  aks_aci_subnet_name             = var.aks_aci_subnet_name
  aks_version                     = var.aks_version
  tenant_id                       = var.tenant_id
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  aks_agent_count                 = var.aks_agent_count
  aks_agent_vm_size               = var.aks_agent_vm_size
  aks_agent_os_disk_size          = var.aks_agent_os_disk_size
  client_id                       = var.client_id
  client_secret                   = var.client_secret
  aks_dns_service_ip              = var.aks_dns_service_ip
  aks_docker_bridge_cidr          = var.aks_docker_bridge_cidr
  aks_service_cidr                = var.aks_service_cidr
  approver_tag                    = var.approver_tag
  owner_tag                       = var.owner_tag
  region_tag                      = var.region_tag
  cost_center_tag                 = var.cost_center_tag
  service_hours_tag               = var.service_hours_tag
  optional_tags                   = var.optional_tags
}


#######################
# Pre-Prod Composistion
#######################

module "pre-prod-network-spoke" {
  source                      = "../../infrastructure-modules/network-spoke"
  resource_prefix             = "PRE-PROD-SPK"
  vnet_address_ranges         = var.vnet_address_ranges
  subnets_spoke               = var.subnets_spoke
  environment                 = var.environment
  region                      = var.region
  nsg_rules_aks_nodes         = var.nsg_rules
  storage_account_name        = var.storage_account_name
  access_key                  = var.access_key
  shared_state_key            = replace(var.state_key, "pre-prod", "shared-services")
  container_name              = "tfstate"
  allow_forwarded_traffic     = "true"
  hub_allow_gateway_transit   = "true"
  hub_use_remote_gateways     = "false"
  spoke_allow_gateway_transit = "false"
  spoke_use_remote_gateways   = "true"

  #TAGS#
  approver_tag      = var.approver_tag
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  service_hours_tag = var.service_hours_tag
  optional_tags     = var.optional_tags
}

module "pre-prod-log-analytics" {
  source           = "../../infrastructure-modules/log-analytics"
  environment      = var.environment
  region           = var.region
  retention_period = "90"
  resource_prefix  = "PP-LOGAW"

  #TAGS#
  approver_tag      = var.approver_tag
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  service_hours_tag = var.service_hours_tag
  optional_tags     = var.optional_tags
}

module "pre-prod-aks-cluster-waf-ingress" {
  source          = "../../infrastructure-modules/aks-cluster-waf-ingress"
  environment     = var.environment
  region          = var.region
  client_secret   = var.client_secret
  client_id       = var.app_id
  tenant_id       = var.tenant_id
  appgw_vnet_name = module.pre-prod-network-spoke.vnet_spoke_name
  appgw_subnet_id = element(matchkeys(
    module.pre-prod-network-spoke.vnet_subnets_spoke_id,
    module.pre-prod-network-spoke.vnet_subnets_names,
    ["aks_waf"],
  ), 0)
  aks_subnet_id = element(matchkeys(
    module.pre-prod-network-spoke.vnet_subnets_spoke_id,
    module.pre-prod-network-spoke.vnet_subnets_names,
    ["aks_nodes"],
  ), 0)
  aks_aci_subnet_name             = "virtual_node_aci"
  log_analytics_workspace_id      = element(module.pre-prod-log-analytics.log_analytics_id, 0)
  admin_user_name                 = var.admin_user_name
  aks_version                     = var.aks_version
  aks_agent_count                 = var.aks_agent_count
  aks_agent_vm_size               = var.aks_agent_vm_size
  aks_agent_os_disk_size          = var.aks_agent_os_disk_size
  aks_dns_service_ip              = var.aks_dns_service_ip
  aks_docker_bridge_cidr          = var.aks_docker_bridge_cidr
  aks_service_cidr                = var.aks_service_cidr
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges

  #TAGS
  approver_tag      = var.approver_tag
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  service_hours_tag = var.service_hours_tag
  optional_tags     = var.optional_tags
}

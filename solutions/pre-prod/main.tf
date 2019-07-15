#######################
# Pre-Prod Composistion
#######################

module "network_spoke" {
  source = "../../infrastructure-modules/network-spoke"
  #common
  environment          = var.environment
  region               = var.region
  storage_account_name = var.storage_account_name
  access_key           = var.access_key
  shared_state_key     = replace(var.state_key, "pre-prod", "shared-services")
  container_name       = "tfstate"
  #vnet
  vnet_address_ranges                    = var.vnet_address_ranges
  subnet_aks_nodes_address_prefix        = var.subnet_aks_nodes_address_prefix
  subnet_virtual_node_aci_address_prefix = var.subnet_virtual_node_aci_address_prefix
  route_address_prefix                   = var.route_address_prefix
  #peering
  allow_forwarded_traffic     = "true"
  hub_allow_gateway_transit   = "true"
  hub_use_remote_gateways     = "false"
  spoke_allow_gateway_transit = "false"
  spoke_use_remote_gateways   = "true"
  #tags
  tags = var.tags
}

module "log_analytics" {
  source = "../../infrastructure-modules/log-analytics"
  #common
  environment = var.environment
  region      = var.region
  #log-aw
  retention_period = "90"
  #tags
  tags = var.tags
}

module "aks_cluster_waf_ingress" {
  source = "../../infrastructure-modules/aks-cluster-waf-ingress"
  #common
  environment          = var.environment
  region               = var.region
  client_secret        = var.client_secret
  client_id            = var.app_id
  tenant_id            = var.tenant_id
  access_key           = var.access_key
  shared_state_key     = replace(var.state_key, "pre-prod", "shared-services")
  container_name       = "tfstate"
  storage_account_name = var.storage_account_name
  #aks
  aks_subnet_id                   = module.network_spoke.subnet_aks_nodes_id
  aks_aci_subnet_name             = module.network_spoke.subnet_virtual_node_aci_name
  log_analytics_workspace_id      = element(module.log_analytics.log_analytics_id, 0)
  admin_user_name                 = var.admin_user_name
  aks_version                     = var.aks_version
  aks_agent_type                  = var.aks_agent_type
  aks_agent_count                 = var.aks_agent_count
  aks_agent_vm_size               = var.aks_agent_vm_size
  aks_dns_service_ip              = var.aks_dns_service_ip
  aks_docker_bridge_cidr          = var.aks_docker_bridge_cidr
  aks_service_cidr                = var.aks_service_cidr
  aks_client_id                   = var.aks_client_id
  aks_server_client_secret        = var.aks_server_client_secret
  aks_server_id                   = var.aks_server_id
  aks_server_object_id            = var.aks_server_object_id
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  #tags
  tags = var.tags
}

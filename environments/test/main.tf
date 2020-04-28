###
# environment composition
###

module "network_hub" {
  source = "../../modules/azure/network-hub"
  #common
  environment = var.environment
  region      = var.region
  #network
  vnet_address_ranges       = var.hub_vnet_address_ranges
  subnet_dmz_address_prefix = var.subnet_dmz_address_prefix
  nsg_rules_dmz             = var.nsg_rules_dmz
  #tags
  tags = var.tags
}

module "network_spoke" {
  source = "../../modules/azure/network-spoke"
  #common
  environment = var.environment
  region      = var.region
  #authentication
  storage_account_name = var.storage_account_name
  access_key           = var.access_key
  shared_state_key     = replace(var.state_key, "test", "shared-services")
  container_name       = "tfstate"
  #network
  vnet_address_ranges            = var.spoke_vnet_address_ranges
  subnet_frontend_address_prefix = var.subnet_frontend_address_prefix
  subnet_backend_address_prefix  = var.subnet_backend_address_prefix
  #peering
  allow_forwarded_traffic     = "true"
  hub_allow_gateway_transit   = "false"
  hub_use_remote_gateways     = "false"
  spoke_allow_gateway_transit = "false"
  spoke_use_remote_gateways   = "false"
  #tags
  tags = var.tags
}
/*
module "aks_cluster_waf_ingress" {
  source                          = "../../modules/azure/aks-cluster-waf-ingress"
  environment                     = var.environment
  region                          = var.region
  client_secret                   = var.client_secret
  vnet_name                       = module.network_spoke.vnet_spoke_name
  vnet_rg                         = module.network_spoke.vnet_spoke_rg
  subnet_app_gw_address_prefix    = var.subnet_app_gw_address_prefix
  subnet_aks_nodes_address_prefix = var.subnet_aks_nodes_address_prefix
  dns_service_ip                  = var.dns_service_ip
  docker_bridge_cidr              = var.docker_bridge_cidr
  service_cidr                    = var.service_cidr

  tags = var.tags
}
*/
module "key_vault_with_p2s_cert" {
  source      = "../../modules/azure/key-vault-with-p2s-cert"
  environment = var.environment
  region      = var.region
  tags        = var.tags
}

module "log_analytics" {
  source      = "../../modules/azure/log-analytics"
  environment = var.environment
  region      = var.region
  tags        = var.tags

}


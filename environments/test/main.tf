###
# environment composition
###

module "network_hub" {
  source             = "../../modules/azure/network_hub"
  environment        = var.environment
  region             = var.region
  address_space      = var.address_space
  address_prefixes   = var.address_prefixes
  vgw_address_prefix = var.vgw_address_prefix
  tags               = var.tags
}

module "network_spoke" {
  source                        = "../../modules/azure/network_spoke"
  environment                   = var.environment
  region                        = var.region
  address_space                 = var.spoke_address_space
  address_prefixes              = var.address_prefixes_spoke
  virtual_network_hub_name      = module.network_hub.virtual_network_name
  virtual_network_hub_id        = module.network_hub.virtual_network_id
  tags                          = var.tags
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

*/
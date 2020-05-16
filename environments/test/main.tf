###
# environment composition
###

module "network_isolated" {
  source               = "../../modules/azure/network_isolated"
  environment          = var.environment
  region               = var.region
  address_space        = var.address_space
  address_prefixes     = var.address_prefixes
  subnet_name_prefixes = var.subnet_name_prefixes
  tags                 = var.tags
}

module "diagnostic_storage_account" {
  source      = "../../modules/azure/diagnostic_storage_account"
  environment = var.environment
  region      = var.region
}

/*
module "windows_jumpbox" {
  source = "../../modules/azure/windows_jumpbox"
  environment = var.environment
  region      = var.region
  subnet_id = element(matchkeys(module.network_isolated.subnet_id,
    module.network_isolated.subnet_name,
  list("snet-management-${var.environment}-${var.region}")), 0)
  storage_account_uri = module.diagnostic_storage_account.primary_blob_endpoint
}

*

module "network_hub" {
  source               = "../../modules/azure/network_hub"
  environment          = var.environment
  region               = var.region
  address_space        = var.address_space
  address_prefixes     = var.address_prefixes
  address_prefix_vgw   = var.address_prefix_vgw
  subnet_name_prefixes = var.subnet_name_prefixes
  tags                 = var.tags
}
/*
module "network_spoke" {
  source                                  = "../../modules/azure/network_spoke"
  environment                             = var.environment
  region                                  = var.region
  address_space                           = var.spoke_address_space
  address_prefixes                        = var.address_prefixes_spoke
  virtual_network_hub_resource_group_name = module.network_hub.virtual_network_resource_group_name
  virtual_network_hub_name                = module.network_hub.virtual_network_name
  virtual_network_hub_id                  = module.network_hub.virtual_network_id
  subnet_name_prefixes                    = var.spoke_subnet_name_prefixes
  tags                                    = var.tags
}

module "aks_agw_ingress" {
  source        = "../../modules/azure/aks_agw_ingress"
  environment   = var.environment
  region        = var.region
  client_secret = var.client_secret
  app_id        = var.app_id
  object_id     = var.object_id
  subnet_id_agw = element(matchkeys(module.network_spoke.subnet_id,
    module.network_spoke.subnet_name,
  list("snet-agw-${var.environment}-${var.region}")), 0)
  subnet_id_aks = element(matchkeys(module.network_spoke.subnet_id,
    module.network_spoke.subnet_name,
  list("snet-aks-${var.environment}-${var.region}")), 0)
  dns_service_ip     = var.dns_service_ip
  docker_bridge_cidr = var.docker_bridge_cidr
  service_cidr       = var.service_cidr

  tags = var.tags
}
*/

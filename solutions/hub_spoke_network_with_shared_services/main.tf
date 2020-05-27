###
#  solution composition
###

module "network_hub" {
  source               = "../../modules/azure/network_hub"
  environment          = var.environment
  region               = var.region
  address_space        = var.address_space
  address_prefixes     = var.address_prefixes
  address_prefix_vgw   = var.address_prefix_vgw
  address_prefix_fw    = var.address_prefix_fw
  subnet_name_prefixes = var.subnet_name_prefixes
  tags                 = var.tags
}

module "network_spoke_1" {
  source                                  = "../../modules/azure/network_spoke"
  environment                             = var.environment
  region                                  = var.region
  address_space                           = var.address_space
  address_prefixes                        = var.address_prefixes
  virtual_network_hub_resource_group_name = module.network_hub.virtual_network_hub_resource_group_name
  virtual_network_hub_name                = module.network_hub.virtual_network_hub_name
  virtual_network_hub_id                  = module.network_hub.virtual_network_hub_id
  subnet_name_prefixes                    = var.subnet_name_prefixes
  tags                                    = var.tags
}

module "network_spoke_2" {
  source                                  = "../../modules/azure/network_spoke"
  environment                             = var.environment
  region                                  = var.region
  address_space                           = var.address_space
  address_prefixes                        = var.address_prefixes
  virtual_network_hub_resource_group_name = module.network_hub.virtual_network_hub_resource_group_name
  virtual_network_hub_name                = module.network_hub.virtual_network_hub_name
  virtual_network_hub_id                  = module.network_hub.virtual_network_hub_id
  subnet_name_prefixes                    = var.subnet_name_prefixes
  tags                                    = var.tags
}

module "diagnostic_storage_account" {
  source      = "../../modules/azure/diagnostic_storage_account"
  environment = var.environment
  region      = var.region
}

module "windows_jumpbox" {
  source      = "../../modules/azure/windows_jumpbox"
  environment = var.environment
  region      = var.region
  subnet_id = element(matchkeys(module.network_hub.subnet_id,
    module.network_hub.subnet_name,
  list("management-${var.environment}-${var.region}")), 0)
  storage_account_uri = module.diagnostic_storage_account.primary_blob_endpoint
}
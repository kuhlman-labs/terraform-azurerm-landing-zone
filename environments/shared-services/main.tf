###
# environment composition
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

module "container_registry" {
  source      = "../../modules/azure/container_registry"
  environment = var.environment
  region      = var.region
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

module "key_vault" {
  source      = "../../modules/azure/key_vault"
  environment = var.environment
  region      = var.region
  object_id   = var.object_id
}

module "domain_controllers" {
  source               = "../../modules/azure/domain_controllers"
  environment          = var.environment
  region               = var.region
  virtual_network_name = module.network_hub.virtual_network_name
  address_prefix_aads  = var.address_prefix_aads
  storage_account_uri  = module.diagnostic_storage_account.primary_blob_endpoint
}
###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "tt-backend"
  region       = var.region
  environment  = var.environment
}

module "cosmosdb_shopping" {
  source            = "../../resources/cosmosdb/cosmosdb_account"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  environment       = var.environment
  name_prefix       = "cosmos-shopping"
  kind              = "GlobalDocumentDB"
  consistency_level = "BoundedStaleness"
  tags              = var.tags
}

module "cosmosdb_coupon" {
  source            = "../../resources/cosmosdb/cosmosdb_account"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  environment       = var.environment
  name_prefix       = "cosmos-coupon"
  kind              = "MongoDB"
  consistency_level = "BoundedStaleness"
  tags              = var.tags
}

module "storage_account_tt_backend" {
  source                   = "../../resources/storage/storage_account"
  resource_group           = module.resource_group.name
  region                   = module.resource_group.location
  environment              = var.environment
  name_prefix              = "stttbackend"
  access_tier              = "Hot"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}
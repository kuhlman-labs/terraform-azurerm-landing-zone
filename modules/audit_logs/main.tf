###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "logs"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

module "log_analytics" {
  source            = "../../resources/log_analytics/log_analytics"
  name_prefix       = "log"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  environment       = var.environment
  sku               = "PerGB2018"
  retention_in_days = 30
  tags              = var.tags
}

module "archive_storage_account" {
  source                   = "../../resources/storage/storage_account"
  resource_group           = module.resource_group.name
  region                   = module.resource_group.location
  environment              = var.environment
  name_prefix              = "starchive"
  access_tier              = "Hot"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}
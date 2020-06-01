###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "audit-logs"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

module "log_analytics" {
  source            = "../../../resources/azurerm/log_analytics/log_analytics"
  name_prefix       = "log-activity"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  environment       = var.environment
  sku               = "PerGB2018"
  retention_in_days = 30
  tags              = var.tags
}

module "archive_storage_account" {
  source                   = "../../../resources/azurerm/storage/storage_account"
  resource_group           = module.resource_group.name
  region                   = module.resource_group.location
  environment              = var.environment
  name_prefix              = "starchive"
  access_tier              = "Hot"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}
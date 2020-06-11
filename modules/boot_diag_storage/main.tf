###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "diagnostic-storage"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}


#diagnostic storage account

module "diagnostic_storage_account" {
  source                   = "../../../resources/azurerm/storage/storage_account"
  resource_group           = module.resource_group.name
  region                   = module.resource_group.location
  environment              = var.environment
  name_prefix              = "stdiag"
  access_tier              = "Hot"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

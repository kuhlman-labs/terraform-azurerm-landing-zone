###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "vm-diagnostic-storage"
  region       = var.region
  environment  = var.environment
}


#diagnostic storage account

module "diagnostic_storage_account" {
  source                   = "../../../resources/azurerm/storage/storage_account"
  resource_group           = module.resource_group.name
  environment              = var.environment
  name_prefix              = "stdiag"
  access_tier              = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
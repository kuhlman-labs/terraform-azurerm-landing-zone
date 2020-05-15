###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "vm-stdiag-logs"
  region       = var.region
  environment  = var.environment
}


#diagnostic storage account

module "diag_storage_account" {
  source         = "../../../resources/azurerm/storage/storage_account"
  resource_group = module.resource_group.name
  environment    = var.environment
  name_prefix    = "stdiag"
}
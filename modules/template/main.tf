###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = ""
  region       = var.region
  environment  = var.environment
}

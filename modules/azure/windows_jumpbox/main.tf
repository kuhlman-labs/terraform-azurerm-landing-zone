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

#nic

module "network_interface" {
  source         = "../../../resources/azurerm/network/network_interface"
  resource_group = module.resource_group.name
  environment    = var.environment
}

#vm

module "virtual_machine" {
  source         = "../../../resources/azurerm/compute/windows_virtual_machine"
  resource_group = module.resource_group.name
  environment    = var.environment
}
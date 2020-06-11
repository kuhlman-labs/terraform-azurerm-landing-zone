###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "network-isolated"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

#vnet

module "virtual_network" {
  source         = "../../../resources/azurerm/network/virtual_network"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  environment    = var.environment
  name_prefix    = "vnet-isolated"
  address_space  = var.address_space
  tags           = var.tags
}
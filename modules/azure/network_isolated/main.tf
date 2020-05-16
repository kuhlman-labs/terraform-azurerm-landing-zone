###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "network-isolated"
  region       = var.region
  environment  = var.environment
}

#vnet

module "virtual_network" {
  source         = "../../../resources/azurerm/network/virtual_network"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  name_prefix    = "vnet-isolated"
  address_space  = var.address_space
  tags           = var.tags
  environment    = var.environment
}

#snets

module "subnet" {
  source               = "../../../resources/azurerm/network/subnet"
  resource_group       = module.resource_group.name
  region               = module.resource_group.location
  virtual_network_name = module.virtual_network.name
  name_prefixes        = var.subnet_name_prefixes
  address_prefixes     = var.address_prefixes
  environment          = var.environment
}
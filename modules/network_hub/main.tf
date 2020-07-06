###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "network-hub"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

#virtual network

module "virtual_network" {
  source         = "../../resources/network/virtual_network"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  environment    = var.environment
  name_prefix    = "vnet-hub"
  address_space  = var.address_space
  dns_servers    = var.dns_servers
  tags           = var.tags
}
###
#  module composition
###

#  resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "network-spoke"
  region       = var.region
  environment  = var.environment
}

#vnet

module "virtual_network" {
  source         = "../../../resources/azurerm/network/virtual_network"
  resource_group = module.resource_group.name
  address_space  = var.address_space
  tags           = var.tags
  environment    = var.environment
}

#snets

module "subnet" {
  source               = "../../../resources/azurerm/network/subnet"
  resource_group       = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  name_prefixes        = ["snet-fontend", "snet-backend"]
  address_prefixes     = var.address_prefixes
  environment          = var.environment
}

#peering hub to spoke

module "virtual_network_peering_hub" {
  source                       = "../../../resources/azurerm/network/virtual_network_peering"
  resource_group_name          = module.resource_group.name
  virtual_network_name         = var.virtual_network_hub_name
  remote_virtual_network_id    = module.virtual_network.id
  remote_virtual_network_name  = module.virtual_network.name
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

#peering spoke to hub

module "virtual_network_peering_spoke" {
  source                       = "../../../resources/azurerm/network/virtual_network_peering"
  resource_group_name          = module.resource_group.name
  virtual_network_name         = module.virtual_network.name
  remote_virtual_network_id    = var.virtual_network_hub_id
  remote_virtual_network_name  = var.virtual_network_hub_name
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = true
}
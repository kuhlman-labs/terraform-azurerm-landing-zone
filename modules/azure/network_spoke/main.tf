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

#virtual network

module "virtual_network" {
  source         = "../../../resources/azurerm/network/virtual_network"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  name_prefix    = "vnet-spoke"
  address_space  = var.address_space
  tags           = var.tags
  environment    = var.environment
}

#peering hub netowork to spoke network

module "virtual_network_peering_hub" {
  source                       = "../../../resources/azurerm/network/virtual_network_peering"
  resource_group_name          = var.virtual_network_hub_resource_group_name
  virtual_network_name         = var.virtual_network_hub_name
  remote_virtual_network_id    = module.virtual_network.id
  remote_virtual_network_name  = module.virtual_network.name
  allow_virtual_network_access = var.allow_virtual_network_access_hub
  allow_forwarded_traffic      = var.allow_forwarded_traffic_hub
  allow_gateway_transit        = var.allow_gateway_transit_hub
  use_remote_gateways          = var.use_remote_gateways_hub
}

#peering spoke network to hub network

module "virtual_network_peering_spoke" {
  source                       = "../../../resources/azurerm/network/virtual_network_peering"
  resource_group_name          = module.resource_group.name
  virtual_network_name         = module.virtual_network.name
  remote_virtual_network_id    = var.virtual_network_hub_id
  remote_virtual_network_name  = var.virtual_network_hub_name
  allow_virtual_network_access = var.allow_forwarded_traffic_spoke
  allow_forwarded_traffic      = var.allow_forwarded_traffic_spoke
  allow_gateway_transit        = var.allow_gateway_transit_spoke
  use_remote_gateways          = var.use_remote_gateways_spoke
}
###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "network-hub"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

#virtual network

module "virtual_network" {
  source         = "../../../resources/azurerm/network/virtual_network"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  environment    = var.environment
  name_prefix    = "vnet-hub"
  address_space  = var.address_space
  tags           = var.tags
}

/*
#Terraform 0.13 will come with count supported for modules, will add this functionality then. Use Case: Peering to network_transit_hub

#peering hub to spoke

module "virtual_network_peering_hub" {
  source                       = "../../../resources/azurerm/network/virtual_network_peering"
  resource_group_name          = var.virtual_network_hub_resource_group_name
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
*/
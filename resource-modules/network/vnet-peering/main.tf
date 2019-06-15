#################################
# Setting up Hub to Spoke Peering
#################################

resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                         = "${upper(var.hub_vnet_name)}-to-${upper(var.spoke_vnet_name)}"
  resource_group_name          = var.hub_vnet_rg
  virtual_network_name         = upper(var.hub_vnet_name)
  remote_virtual_network_id    = var.spoke_vnet_id
  allow_virtual_network_access = var.allow_vnet_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = var.hub_allow_gateway_transit
  use_remote_gateways          = var.hub_use_remote_gateways
  provider                     = azurerm.shared-services
}

#################################
# Setting up Spoke to Hub Peering
#################################

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                         = "${upper(var.spoke_vnet_name)}-to-${upper(var.hub_vnet_name)}"
  resource_group_name          = var.spoke_vnet_rg
  virtual_network_name         = var.spoke_vnet_name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = var.allow_vnet_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = var.spoke_allow_gateway_transit
  use_remote_gateways          = var.spoke_use_remote_gateways
}


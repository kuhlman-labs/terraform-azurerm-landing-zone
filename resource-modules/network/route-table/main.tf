
###########################
# Setting up Resource Group
###########################

data "azurerm_resource_group" "route_table" {
  name = var.resource_group
}

#Setting up Route Table

resource "azurerm_route_table" "base" {
  name                          = var.route_table_name
  location                      = data.azurerm_resource_group.route_table.location
  resource_group_name           = data.azurerm_resource_group.route_table.name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation

  route {
    name                   = var.route_name
    address_prefix         = var.route_address_prefix
    next_hop_type          = var.route_next_hop_type
    next_hop_in_ip_address = var.route_next_hop_in_ip_address
  }
}
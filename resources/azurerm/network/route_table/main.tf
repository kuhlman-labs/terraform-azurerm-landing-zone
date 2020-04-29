###
# resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#route table

resource "azurerm_route_table" "base" {
  name                          = "${data.azurerm_resource_group.base.name}-${var.name_prefix}"
  location                      = data.azurerm_resource_group.base.location
  resource_group_name           = data.azurerm_resource_group.base.name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation

  route {
    name                   = var.route_name
    address_prefix         = var.route_address_prefix
    next_hop_type          = var.route_next_hop_type
    next_hop_in_ip_address = var.route_next_hop_in_ip_address
  }
}
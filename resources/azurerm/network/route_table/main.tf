###
# resource composition
###

#route table

resource "azurerm_route_table" "base" {
  name                          = "${var.name_prefix}-${var.environment}-${var.region}"
  location                      = var.region
  resource_group_name           = var.resource_group
  disable_bgp_route_propagation = var.disable_bgp_route_propagation

  route {
    name                   = var.route_name
    address_prefix         = var.route_address_prefix
    next_hop_type          = var.route_next_hop_type
    next_hop_in_ip_address = var.route_next_hop_in_ip_address
  }
}
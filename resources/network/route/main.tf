###
# resource composition
###

#route table

resource "azurerm_route" "base" {
  name                   = "${var.route_name}-${var.environment}-${var.region}"
  resource_group_name    = var.resource_group
  route_table_name       = var.route_table_name
  address_prefix         = var.address_prefix
  next_hop_type          = var.next_hop_type
  next_hop_in_ip_address = var.next_hop_in_ip_address
}
###
# resource composition
###

#route table

resource "azurerm_route_table" "base" {
  name                          = "${var.name_prefix}-${var.environment}-${var.region}"
  location                      = var.region
  resource_group_name           = var.resource_group
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  tags                          = var.tags
}
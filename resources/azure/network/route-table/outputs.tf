###
# resource outputs
###

output "route_table_id" {
  value = azurerm_route_table.base.id
}

output "route_table_subnets" {
  value = azurerm_route_table.base.subnets
}

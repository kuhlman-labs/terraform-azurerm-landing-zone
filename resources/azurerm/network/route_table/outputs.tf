###
# resource outputs
###

output "id" {
  value = azurerm_route_table.base.id
}

output "subnets" {
  value = azurerm_route_table.base.subnets
}

###
# resource outputs
###

output "id" {
  description = "The Route Table ID."
  value       = azurerm_route_table.base.id
}

output "name" {
  description = "The Route Table Name."
  value       = azurerm_route_table.base.name
}

output "subnets" {
  description = "The collection of Subnets associated with this route table."
  value       = azurerm_route_table.base.subnets
}

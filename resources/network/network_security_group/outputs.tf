###
# resource outputs
###

output "id" {
  value       = azurerm_network_security_group.base.id
  description = "The ID of the Network Security Group."
}

output "name" {
  value       = azurerm_network_security_group.base.name
  description = "The Name of the Network Security Group."
}
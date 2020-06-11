###
# resource outputs
###

output "id" {
  value       = azurerm_virtual_network_gateway.base.id
  description = "The ID of the Virtual Network Gateway."
}


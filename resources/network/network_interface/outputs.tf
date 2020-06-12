###
# resource outputs
###

output "id" {
  value       = azurerm_network_interface.base[*].id
  description = "The ID of the Network Interface."
}

output "ip_configuration_name" {
  value       = azurerm_network_interface.base[*].ip_configuration[0].name
  description = "The name used for this IP Configuration."
}
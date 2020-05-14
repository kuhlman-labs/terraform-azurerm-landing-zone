###
# resource outputs
###

output "id" {
  value       = azurerm_network_interface.base[*].id
  description = "The ID of the Network Interface."
}
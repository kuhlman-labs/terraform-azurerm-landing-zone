###
# resource outputs
###

output "id" {
  value       = azurerm_virtual_network_peering.base.id
  description = "The ID of the Virtual Network Peering."
}
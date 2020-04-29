###
# resource outputs
###

output "virtual_network_peering_id" {
  value       = azurerm_virtual_network_peering.base.id
  description = "The ID of the Virtual Network Peering."
}
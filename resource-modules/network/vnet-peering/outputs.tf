output "vnet_hub_to_spoke_peering_id" {
  value       = azurerm_virtual_network_peering.hub_to_spoke.id
  description = "Resource id for peering between hub and spoke vnet"
}

output "vnet_spoke_to_hub_peering_id" {
  value       = azurerm_virtual_network_peering.spoke_to_hub.id
  description = "Resource id for peering between spoke and hub vnet"
}


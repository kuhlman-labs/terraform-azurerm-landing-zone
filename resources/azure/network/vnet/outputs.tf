output "vnet_rg_name" {
  value       = data.azurerm_resource_group.base.name
  description = "Generated vnet resource group name"
}

output "vnet_rg_id" {
  value       = data.azurerm_resource_group.base.id
  description = "Vnet owning resource group id"
}

output "vnet_name" {
  value       = azurerm_virtual_network.base.name
  description = "Generated vnet name"
}

output "vnet_id" {
  value       = azurerm_virtual_network.base.id
  description = "vnet resource id"
}


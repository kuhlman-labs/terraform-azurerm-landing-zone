output "resource_group_name" {
  value       = azurerm_resource_group.main.name
  description = "Generated resource group name"
}

output "resource_group_id" {
  value       = azurerm_resource_group.main.id
  description = "Generated resource group id"
}

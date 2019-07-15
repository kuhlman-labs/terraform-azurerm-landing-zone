output "resource_group_name" {
  value       = azurerm_resource_group.base.name
  description = "Generated resource group name"
}

output "resource_group_id" {
  value       = azurerm_resource_group.base.id
  description = "Generated resource group id"
}

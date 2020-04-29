###
# resource outputs
###

output "resource_group_name" {
  value       = azurerm_resource_group.base.name
  description = "resource group name"
}

output "resource_group_id" {
  value       = azurerm_resource_group.base.id
  description = "resource group id"
}

###
# resource outputs
###

output "id" {
  value       = azurerm_container_registry.base.id
  description = "The ID of the Container Registry."
}
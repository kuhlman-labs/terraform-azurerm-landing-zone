###
# resource outputs
###

output "id" {
  value       = azurerm_app_service_plan.base.id
  description = "The ID of the App Service Plan."
}
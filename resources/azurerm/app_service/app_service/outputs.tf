###
# resource outputs
###

output "default_site_hostname" {
  value       = azurerm_app_service.base.default_site_hostname
  description = "The Name of this Resource Group."
}

output "id" {
  value       = azurerm_app_service.base.id
  description = "The ID of the App Service."
}
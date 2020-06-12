###
# resource outputs
###

output "id" {
  value       = azurerm_storage_account.base.id
  description = "The storage account Resource ID."
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.base.primary_blob_endpoint
  description = "The endpoint URL for blob storage in the primary location."
}
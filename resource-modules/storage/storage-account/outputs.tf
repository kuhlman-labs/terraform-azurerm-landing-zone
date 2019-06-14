output "storage_account_id" {
  value       = "${azurerm_storage_account.main.id}"
  description = "Resource id of the created storage account"
}

output "storage_account_name" {
  value       = "${azurerm_storage_account.main.name}"
  description = "Name generated for the created storage account"
}

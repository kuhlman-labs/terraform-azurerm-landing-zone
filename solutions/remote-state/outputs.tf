output "terraform_state_primary_shared_key" {
  value       = "${azurerm_storage_account.terraform_state_storage_account.*.primary_access_key}"
  description = "Primary access key for the state storage account"
}

output "terraform_state_storage_account_name" {
  value       = "${azurerm_storage_account.terraform_state_storage_account.*.name}"
  description = "Name of the state storage account"
}

output "storage_account_id" {
  value       = "${module.storage_account.storage_account_id}"
  description = "Storage account resource id"
}

output "storage_account_name" {
  value       = "${module.storage_account.storage_account_name}"
  description = "Generated storage account name"
}

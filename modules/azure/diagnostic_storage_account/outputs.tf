###
#  module outputs
###

output "id" {
  value       = module.diagnostic_storage_account.id
  description = "The storage account Resource ID."
}

output "primary_blob_endpoint" {
  value       = module.diagnostic_storage_account.primary_blob_endpoint
  description = "The endpoint URL for blob storage in the primary location."
}
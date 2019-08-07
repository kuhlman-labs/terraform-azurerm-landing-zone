###
#  module outputs
###

output "key_vault_id" {
  value       = module.key_vault.key_vault_id
  description = "key vault resource id"
}

output "key_vault_p2s_certificate_data" {
  value       = module.key_vault_p2s_certificate.key_vault_import_certificate_data
  description = "raw key vault certificate"
}


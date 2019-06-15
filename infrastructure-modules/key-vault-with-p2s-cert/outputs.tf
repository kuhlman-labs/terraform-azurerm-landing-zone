output "key_vault_id" {
  value       = module.key-vault.key_vault_id
  description = "Key Vault resource id"
}

output "key_vault_p2s_certificate_data" {
  value       = module.key-vault-p2s-certificate.key_vault_p2s_certificate_data
  description = "Raw Key Vault Certificate"
}


output "key_vault_p2s_certificate_data" {
  value       = azurerm_key_vault_certificate.base.certificate_data
  description = "Raw Key Vault Certificate"
}


###
# resource outputs
###

output "key_vault_import_certificate_data" {
  value       = azurerm_key_vault_certificate.base.certificate_data
  description = "Raw Key Vault certificate data"
}


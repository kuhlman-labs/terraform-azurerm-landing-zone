###
# resource outputs
###

output "id" {
  value       = azurerm_key_vault_certificate.base.id
  description = "The Key Vault Certificate ID."
}

output "certificate_data" {
  value       = azurerm_key_vault_certificate.base.certificate_data
  description = "Raw Key Vault certificate data"
}


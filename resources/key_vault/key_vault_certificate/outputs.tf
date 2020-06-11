###
# resource outputs
###

output "id" {
  value       = azurerm_key_vault_certificate.base.id
  description = "The Key Vault Certificate ID."
}

output "certificate_data" {
  value       = azurerm_key_vault_certificate.base.certificate_data
  description = "The raw Key Vault Certificate data represented as a hexadecimal string."
}

output "thumbprint" {
  value       = azurerm_key_vault_certificate.base.thumbprint
  description = "The X509 Thumbprint of the Key Vault Certificate represented as a hexadecimal string."
}

###
# resource outputs
###

output "id" {
  value       = azurerm_key_vault.base.id
  description = "Key Vault resource id"
}

output "vault_uri" {
  value       = azurerm_key_vault.base.vault_uri
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
}
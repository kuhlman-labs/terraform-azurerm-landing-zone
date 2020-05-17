###
# resource outputs
###

output "id" {
  value       = azurerm_key_vault_access_policy.base.id
  description = "Key Vault Access Policy ID."
}
output "key_vault_id" {
  value       = "${azurerm_key_vault.main.id}"
  description = "Key Vault resource id"
}

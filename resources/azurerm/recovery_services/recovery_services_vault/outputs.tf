###
#  resource outputs
###

output "id" {
  value       = azurerm_recovery_services_vault.base.id
  description = "The ID of the Recovery Services Vault."
}


###
#  resource outputs
###

output "recovery_services_id" {
  value       = azurerm_recovery_services_vault.base.*.id
  description = "Recovery Services Vault resource id"
}


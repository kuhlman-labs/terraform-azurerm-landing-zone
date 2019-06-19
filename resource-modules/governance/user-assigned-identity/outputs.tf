output "uai_id" {
  value = azurerm_user_assigned_identity.base.id
}

output "uai_principal_id" {
  value = azurerm_user_assigned_identity.base.principal_id
}

output "uai_client_id" {
  value = azurerm_user_assigned_identity.base.client_id
}


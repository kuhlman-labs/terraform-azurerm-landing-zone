###
# resource outputs
###

output "id" {
  value = azurerm_user_assigned_identity.base.id
}

output "principal_id" {
  value = azurerm_user_assigned_identity.base.principal_id
}

output "client_id" {
  value = azurerm_user_assigned_identity.base.client_id
}

output "name" {
  value = azurerm_user_assigned_identity.base.name
}

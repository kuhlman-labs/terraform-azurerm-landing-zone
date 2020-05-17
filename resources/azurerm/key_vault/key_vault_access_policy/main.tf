###
# resource composition
###

data "azurerm_client_config" "current" {
}

#key vault access policy

resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id            = var.key_vault_id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = var.object_id
  application_id          = var.application_id
  certificate_permissions = var.certificate_permissions
  key_permissions         = var.key_permissions
  secret_permissions      = var.secret_permissions
}

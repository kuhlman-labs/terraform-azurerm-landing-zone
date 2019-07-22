############################
# Setting up role assignment
############################

resource "azurerm_role_assignment" "base" {
  scope                = var.scope
  role_definition_name = var.role_definition_name
  principal_id         = var.principal_id
}

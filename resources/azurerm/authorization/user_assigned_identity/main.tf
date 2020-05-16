###
# resource composition
###

#user assigned identity

resource "azurerm_user_assigned_identity" "base" {
  resource_group_name = var.resource_group
  location            = var.region
  name                = "${var.name_prefix}-${var.environment}-${var.region}"
}

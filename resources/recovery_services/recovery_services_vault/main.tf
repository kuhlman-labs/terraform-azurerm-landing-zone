###
#  resource composition
###

#recovery services vault

resource "azurerm_recovery_services_vault" "base" {
  name                = "${var.name_prefix}-${var.environment}-${var.region}"
  location            = var.region
  resource_group_name = var.resource_group
  sku                 = var.sku
  soft_delete_enabled = var.soft_delete_enabled
  tags                = var.tags
}


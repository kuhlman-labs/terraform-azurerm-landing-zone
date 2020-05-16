###
#  resource composition
###

#recovery services vault

resource "azurerm_recovery_services_vault" "base" {
  name                = "${var.resource_group}-${var.name_prefix}"
  location            = var.region
  resource_group_name = var.resource_group
  sku                 = var.sku

  tags = var.tags
}


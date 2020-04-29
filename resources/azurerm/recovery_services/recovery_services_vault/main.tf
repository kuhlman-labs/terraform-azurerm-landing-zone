###
#  resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#recovery services vault

resource "azurerm_recovery_services_vault" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.name_prefix}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
  sku                 = var.sku

  tags = var.tags
}


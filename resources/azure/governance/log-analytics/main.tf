###
# resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#random permutation of alphanumeric characters

resource "random_string" "base" {
  length  = 8
  special = false
}

#log analytics workspace

resource "azurerm_log_analytics_workspace" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}-${random_string.base.result}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
  sku                 = var.sku
  retention_in_days   = var.retention_period
  tags                = var.tags
}


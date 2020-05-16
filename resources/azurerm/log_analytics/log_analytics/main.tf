###
# resource composition
###

#random 

resource "random_string" "base" {
  length  = 8
  special = false
}

#log analytics workspace

resource "azurerm_log_analytics_workspace" "base" {
  name                = "${var.resource_group}-${var.name_prefix}-${random_string.base.result}"
  location            = var.region
  resource_group_name = var.resource_group
  sku                 = var.sku
  retention_in_days   = var.retention_period
  tags                = var.tags
}


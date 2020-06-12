###
# resource composition
###

#random string

resource "random_string" "base" {
  length  = 6
  special = false
}

#log analytics workspace

resource "azurerm_log_analytics_workspace" "base" {
  name                = lower("${var.name_prefix}${random_string.base.result}-${var.environment}-${var.region}")
  location            = var.region
  resource_group_name = var.resource_group
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
  tags                = var.tags
}


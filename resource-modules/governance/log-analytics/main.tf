###########################
# Setting up resource group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

############################################
#Setting up Random String generator for name
############################################

resource "random_string" "base" {
  length  = 8
  special = false
}

####################################
# Setting up Log Analytics Workspace
####################################

resource "azurerm_log_analytics_workspace" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}-${random_string.base.result}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
  sku                 = var.sku
  retention_in_days   = var.retention_period
  tags                = var.tags
}


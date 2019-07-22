###########################
# Setting up Resource Group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

####################################
# Setting up Recovery Services Vault
####################################

resource "azurerm_recovery_services_vault" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
  sku                 = var.sku

  tags = var.tags
}


###########################
# Setting up resource group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#################
# Setting up VNet
#################

resource "azurerm_virtual_network" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}"
  address_space       = var.vnet_address_ranges
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
  tags                = var.tags
}


###
# resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#vnet

resource "azurerm_virtual_network" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.name_prefix}"
  address_space       = var.vnet_address_ranges
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
  tags                = var.tags
  dns_servers         = var.dns_servers

}


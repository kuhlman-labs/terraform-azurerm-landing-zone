###
# resource composition
###

#vnet

resource "azurerm_virtual_network" "base" {
  name                = "${var.name_prefix}-${var.environment}-${var.region}"
  resource_group_name = var.resource_group
  address_space       = var.address_space
  location            = var.region
  dns_servers         = var.dns_servers

  tags = var.tags

}


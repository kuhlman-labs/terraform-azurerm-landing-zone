###
# resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#firewall

resource "azurerm_firewall" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.name_prefix}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name

  ip_configuration {
    name                 = "${data.azurerm_resource_group.base.name}-${var.name_prefix}-ip-configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_address_id
  }
  tags = var.tags
}
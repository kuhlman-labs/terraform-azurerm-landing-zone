###
# resource composition
###

#firewall

resource "azurerm_firewall" "base" {
  name                = "${var.resource_group}-${var.name_prefix}"
  location            = var.region
  resource_group_name = var.resource_group

  ip_configuration {
    name                 = "${var.resource_group}-${var.name_prefix}-ip-configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_address_id
  }
  tags = var.tags
}
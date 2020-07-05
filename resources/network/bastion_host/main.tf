###
# resource composition
###

resource "azurerm_bastion_host" "base" {
  name                = "${var.name_prefix}-${var.environment}-${var.region}"
  location            = var.region
  resource_group_name = var.resource_group

  ip_configuration {
    name                 = "ip-${var.name_prefix}-${var.environment}-${var.region}"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_address_id
  }

  tags = var.tags
}
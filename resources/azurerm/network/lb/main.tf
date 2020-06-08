###
# resource composition
###

resource "azurerm_lb" "base" {
  name                = "${var.name_prefix}-${var.environment}-${var.region}"
  location            = var.region
  resource_group_name = var.resource_group
  sku                 = var.sku

  frontend_ip_configuration {
    name                          = "feip-config-${var.name_prefix}"
    subnet_id                     = var.subnet_id
    private_ip_address            = var.private_ip_address
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address_version    = var.private_ip_address_version
    public_ip_address_id          = var.public_ip_address_id
    public_ip_prefix_id           = var.public_ip_prefix_id
    zones                         = var.zones
  }
}
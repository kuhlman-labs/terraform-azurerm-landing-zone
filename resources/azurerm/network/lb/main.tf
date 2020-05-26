###
# resource composition
###

resource "azurerm_lb" "base" {
  name                = "${var.name_prefix}-${var.environment}-${var.region}"
  location            = var.region
  resource_group_name = var.resource_group
  sku                 = var.sku

  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configuration
    content {
      name                       = frontend_ip_configuration.value.name
      subnet_id                  = frontend_ip_configuration.value.subnet_id
      private_ip_address         = frontend_ip_configuration.value.private_ip_address
      private_ip_address_version = frontend_ip_configuration.value.private_ip_address_version
      public_ip_address_id       = frontend_ip_configuration.value.public_ip_address_id
      public_ip_prefix_id        = frontend_ip_configuration.value.public_ip_prefix_id
      zones                      = frontend_ip_configuration.value.zones
    }
  }
}
###
# resource composition
###

#firewall

resource "azurerm_subnet" "base" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_firewall" "base" {
  name                = "${var.name_prefix}-${var.environment}-${var.region}"
  location            = var.region
  resource_group_name = var.resource_group
  zones               = var.zones

  ip_configuration {
    name                 = "ip-${var.name_prefix}-${var.environment}-${var.region}"
    subnet_id            = azurerm_subnet.base.id
    public_ip_address_id = var.public_ip_address_id
  }
  tags = var.tags
}
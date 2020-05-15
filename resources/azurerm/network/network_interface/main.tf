###
# resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#network interface

resource "azurerm_network_interface" "base" {
  count = var.nic_count

  name                          = "${var.name_prefix}-${count.index}-${var.environment}"
  location                      = data.azurerm_resource_group.base.location
  resource_group_name           = data.azurerm_resource_group.base.name
  dns_servers                   = var.dns_servers
  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  internal_dns_name_label       = var.internal_dns_name_label

  ip_configuration {
    name                          = "ip-${var.name_prefix}"
    subnet_id                     = var.subnet_id
    private_ip_address_version    = var.private_ip_address_version
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_id
    primary                       = var.primary
    private_ip_address            = var.private_ip_address
  }
}
data "azurerm_resource_group" "base" {
  name = var.resource_group
}

resource "azurerm_network_security_rule" "base" {
  #for_each                    = var.nsg_rules
  name                        = nsg_rules.value.name
  priority                    = nsg_rules.value.priority
  direction                   = nsg_rules.value.direction
  access                      = nsg_rules.value.access
  protocol                    = nsg_rules.value.protocol
  source_port_range           = nsg_rules.value.source_port_range
  destination_port_range      = nsg_rules.value.destination_port_range
  source_address_prefix       = nsg_rules.value.source_address_prefix
  destination_address_prefix  = nsg_rules.value.destination_address_prefix
  resource_group_name         = data.azurerm_resource_group.base.name
  network_security_group_name = var.nsg_name
}
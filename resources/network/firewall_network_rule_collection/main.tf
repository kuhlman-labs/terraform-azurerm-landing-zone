###
# resource composition
###

#firewall network rule collection

resource "azurerm_firewall_network_rule_collection" "base" {
  name                = "${var.name_prefix}-${var.environment}-${var.region}"
  azure_firewall_name = var.azure_firewall_name
  resource_group_name = var.resource_group
  priority            = var.priority
  action              = var.action

  dynamic "rule" {
    for_each = var.rule
    content {
      name                  = rule.value.name
      source_addresses      = rule.value.source_addresses
      destination_ports     = rule.value.destination_ports
      destination_addresses = rule.value.destination_addresses
      protocols             = rule.value.protocols
    }
  }
}

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

resource "azurerm_firewall_network_rule_collection" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}"
  azure_firewall_name = var.azure_firewall_name
  resource_group_name = data.azurerm_resource_group.base.name
  priority            = var.collection_priority
  action              = var.collection_action

  dynamic "rule"{
    for_each = var.rule
    content {
      name = rule.value.name
      source_addresses = rule.value.source_addresses
      destination_ports = rule.value.destination_ports
      destination_addresses= rule.value.destination_addresses
      protocols = rule.value.protocols
    }
  }

  /*

  rule {
    name                  = var.rule_name
    source_addresses      = var.rule_source_addresses
    destination_ports     = var.rule_destination_ports
    destination_addresses = var.rule_destination_addresses
    protocols             = var.rule_protocols
  }
  */
}

###########################
# Setting up resource group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#############################################
# Setting up firewall network rule collection 
#############################################

resource "azurerm_firewall_network_rule_collection" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}"
  azure_firewall_name = var.azure_firewall_name
  resource_group_name = data.azurerm_resource_group.base.name
  priority            = var.collection_priority
  action              = var.collection_action

  rule {
    name                  = var.rule_name
    source_addresses      = var.rule_source_addresses
    destination_ports     = var.rule_destination_ports
    destination_addresses = var.rule_destination_addresses
    protocols             = var.rule_protocols
  }
}

###########################
# Setting up resource group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#####################
# Setting up firewall
#####################

resource "azurerm_firewall" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name

  ip_configuration {
    name                 = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}-ip-configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_address_id
  }
  tags = var.tags
}

#############################################
# Setting up firewall network rule collection 
#############################################

resource "azurerm_firewall_network_rule_collection" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}-network-rule-collection"
  azure_firewall_name = azurerm_firewall.base.name
  resource_group_name = data.azurerm_resource_group.base.name
  priority            = var.firewall_collection_priority
  action              = var.firewall_collection_action

  rule {
    name                  = var.firewall_rule_name
    source_addresses      = var.firewall_rule_source_addresses
    destination_ports     = var.firewall_rule_destination_ports
    destination_addresses = var.firewall_rule_destination_addresses
    protocols             = var.firewall_rule_protocols
  }
}

########################################
#Setting up Locals for Tags and Resource
########################################

locals {
  mandatory_tags = {
    Owner         = var.owner_tag
    region        = var.region_tag
    Cost-Center   = var.cost_center_tag
    Approver      = var.approver_tag
    Service-Hours = var.service_hours_tag
  }
}

###########################
# Setting up Resource Group
###########################

data "azurerm_resource_group" "firewall_nrc" {
  name = var.resource_group
}


# Setting up Firewall network rule collection


resource "azurerm_firewall_network_rule_collection" "base" {
  name                = var.firewall_collection_name
  azure_firewall_name = var.firewall_name
  resource_group_name = data.azurerm_resource_group.firewall_nrc.name
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

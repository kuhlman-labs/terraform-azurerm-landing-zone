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

data "azurerm_resource_group" "firewall" {
  name = var.resource_group
}

#####################
# Setting up Firewall
#####################

resource "azurerm_public_ip" "firewall" {
  name                = "${upper(var.resource_prefix)}-ip"
  location            = data.azurerm_resource_group.firewall.location
  resource_group_name = data.azurerm_resource_group.firewall.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "base" {
  name                = "${upper(var.resource_prefix)}-${upper(var.region)}-${upper(var.environment)}"
  location            = data.azurerm_resource_group.firewall.location
  resource_group_name = data.azurerm_resource_group.firewall.name

  ip_configuration {
    name                 = "${upper(var.resource_prefix)}-ip-collection"
    subnet_id            = var.firewall_subnet_id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }
  tags = merge(local.mandatory_tags, var.optional_tags)
}

resource "azurerm_firewall_network_rule_collection" "base" {
  name                = "${upper(var.resource_prefix)}-${upper(var.region)}-${upper(var.environment)}"
  azure_firewall_name = azurerm_firewall.base.name
  resource_group_name = data.azurerm_resource_group.firewall.name
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

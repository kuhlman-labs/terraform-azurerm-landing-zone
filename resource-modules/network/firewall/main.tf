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
  name                = "${var.firewall_name}-ip"
  location            = data.azurerm_resource_group.firewall.location
  resource_group_name = data.azurerm_resource_group.firewall.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "base" {
  name                = var.firewall_name
  location            = data.azurerm_resource_group.firewall.location
  resource_group_name = data.azurerm_resource_group.firewall.name

  ip_configuration {
    name                 = "${var.firewall_name}-ip-configuration"
    subnet_id            = var.firewall_subnet_id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }
  tags = merge(local.mandatory_tags, var.optional_tags)
}

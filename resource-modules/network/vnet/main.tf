###########################
#Setting up Locals for Tags
###########################

locals {
  MANDATORY_TAGS = {
    Name          = "${data.azurerm_resource_group.vnet.name}-${upper(var.tier)}"
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

data "azurerm_resource_group" "vnet" {
  name = var.resource_group
}

#################
# Setting up VNet
#################

resource "azurerm_virtual_network" "main" {
  name                = "${data.azurerm_resource_group.vnet.name}-${upper(var.tier)}"
  address_space       = var.vnet_address_ranges
  location            = data.azurerm_resource_group.vnet.location
  resource_group_name = data.azurerm_resource_group.vnet.name

  tags = merge(local.MANDATORY_TAGS, var.optional_tags)
}


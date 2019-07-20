###########################
# Setting up resource group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

###################
# Setting up Subnet
###################

resource "azurerm_subnet" "base" {
  name                 = var.subnet_name
  address_prefix       = var.subnet_address_prefix
  resource_group_name  = data.azurerm_resource_group.base.name
  virtual_network_name = var.vnet_name
  service_endpoints    = var.subnet_service_endpoints
  delegation {
    name = var.delegation_name
    service_delegation {
      name    = var.service_delegation_name
      actions = var.service_delegation_actions
    }
  }
}



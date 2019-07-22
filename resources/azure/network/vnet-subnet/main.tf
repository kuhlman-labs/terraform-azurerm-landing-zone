###########################
# Setting up resource group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

####################
# Setting up Subnets
####################

resource "azurerm_subnet" "base" {
  name                      = var.subnet_name
  address_prefix            = var.subnet_address_prefix
  resource_group_name       = data.azurerm_resource_group.base.name
  virtual_network_name      = var.vnet_name
  service_endpoints         = var.subnet_service_endpoints
  route_table_id            = var.route_table_id
  network_security_group_id = var.network_security_group_id

  dynamic "delegation" {
    for_each = [for d in var.delegations : {
      name                       = d.delegation_name
      service_deleagion_name     = d.service_delegation_name
      service_delegation_actions = d.service_delegation_actions
    }]

    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_deleagion_name
        actions = delegation.value.service_delegation_actions
      }
    }
  }
}



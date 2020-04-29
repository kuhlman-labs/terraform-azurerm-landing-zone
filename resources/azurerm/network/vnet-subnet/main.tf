###
# resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#subnet

resource "azurerm_subnet" "base" {
  name                      = var.subnet_name
  address_prefix            = var.subnet_address_prefix
  resource_group_name       = data.azurerm_resource_group.base.name
  virtual_network_name      = var.vnet_name
  service_endpoints         = var.subnet_service_endpoints

  dynamic "delegation" {
    for_each = var.delegations
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_deleagion_name
        actions = delegation.value.service_delegation_actions
      }
    }
  }
}



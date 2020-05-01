###
# resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#subnet

resource "azurerm_subnet" "base" {
  name                                           = "${var.name_prefix}-${var.environment}-${data.azurerm_resource_group.base.location}"
  address_prefix                                 = var.subnet_address_prefix
  resource_group_name                            = data.azurerm_resource_group.base.name
  virtual_network_name                           = var.vnet_name
  service_endpoints                              = var.subnet_service_endpoints
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies

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



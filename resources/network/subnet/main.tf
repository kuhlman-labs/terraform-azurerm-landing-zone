###
# resource composition
###

#subnet

resource "azurerm_subnet" "base" {
  name  = "${element(var.name_prefixes, count.index)}-${var.environment}-${var.region}"
  count = length(var.name_prefixes)

  resource_group_name                            = var.resource_group
  address_prefixes                               = [element(var.address_prefixes, count.index)]
  virtual_network_name                           = var.virtual_network_name
  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies

  dynamic "delegation" {
    for_each = var.delegation
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegation_name
        actions = delegation.value.service_delegation_actions
      }
    }
  }
}



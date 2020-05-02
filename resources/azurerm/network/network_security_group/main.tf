###
# resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#network security group

resource "azurerm_network_security_group" "base" {
  name                = "${var.name_prefix}-${var.policy_name}-${var.environment}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
}
###
# resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#user assigned identity

resource "azurerm_user_assigned_identity" "base" {
  resource_group_name = data.azurerm_resource_group.base.name
  location            = data.azurerm_resource_group.base.location
  name                = var.uai_name
}

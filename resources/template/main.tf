###
# resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}
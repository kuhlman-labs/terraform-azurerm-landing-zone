###########################
# Setting up Resource Group
###########################

data "azurerm_resource_group" "uai" {
  name = var.resource_group
}


################
# Setting up UAI
################

resource "azurerm_user_assigned_identity" "base" {
  resource_group_name = data.azurerm_resource_group.uai.name
  location            = data.azurerm_resource_group.uai.location

  name = var.uai_name
}

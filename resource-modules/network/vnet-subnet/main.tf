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
}



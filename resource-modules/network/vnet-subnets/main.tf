#############################################################################
# Setting up Resource Group *****Must be in same resource group as vNet *****
#############################################################################

data "azurerm_resource_group" "vnet" {
  name = "${var.resource_group}"
}

####################
# Setting up Subnets
####################

resource "azurerm_subnet" "main" {
  count = "${length(var.subnets)}"

  name                 = "${lookup("${var.subnets[count.index]}","name")}"
  address_prefix       = "${lookup("${var.subnets[count.index]}", "subnet_cidr")}"
  resource_group_name  = "${data.azurerm_resource_group.vnet.name}"
  virtual_network_name = "${var.vnet_name}"
  service_endpoints    = "${split(",", lookup("${var.subnets[count.index]}", "service_endpoints", ""))}"
}

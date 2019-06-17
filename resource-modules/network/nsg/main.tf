###########################
# Setting up Resource Group
###########################

data "azurerm_resource_group" "vnet" {
  name = var.resource_group
}

################
# Setting up NSG
################

resource "azurerm_network_security_group" "main" {
  count               = length(var.subnet_names)
  name                = "${upper(var.resource_prefix)}-${data.azurerm_resource_group.vnet.name}-${upper(element(var.subnet_names, count.index))}"
  location            = data.azurerm_resource_group.vnet.location
  resource_group_name = data.azurerm_resource_group.vnet.name
}

######################
# Setting up NSG Rules
######################

resource "azurerm_network_security_rule" "main" {
  count                       = length(var.nsg_rules)
  name                        = var.nsg_rules[count.index]["name"]
  priority                    = var.nsg_rules[count.index]["priority"]
  direction                   = var.nsg_rules[count.index]["direction"]
  access                      = var.nsg_rules[count.index]["access"]
  protocol                    = var.nsg_rules[count.index]["protocol"]
  source_port_range           = var.nsg_rules[count.index]["source_port_range"]
  destination_port_range      = var.nsg_rules[count.index]["destination_port_range"]
  source_address_prefix       = var.nsg_rules[count.index]["source_address_prefix"]
  destination_address_prefix  = var.nsg_rules[count.index]["destination_address_prefix"]
  resource_group_name         = data.azurerm_resource_group.vnet.name
  network_security_group_name = "${element("${azurerm_network_security_group.main.*.name}", count.index)}"
}

#############################
# Setting up NSG associations
#############################

resource "azurerm_subnet_network_security_group_association" "nsg_subnets" {
  count                     = length(var.subnet_names)
  subnet_id                 = element(var.subnet_ids, count.index)
  network_security_group_id = azurerm_network_security_group.main[count.index].id
}


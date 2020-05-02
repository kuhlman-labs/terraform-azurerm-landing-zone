###
#  module composition
###

#  resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "network-hub"
  region       = var.region
  environment  = var.environment
}

#vnet

module "virtual_network" {
  source         = "../../../resources/azurerm/network/virtual_network"
  resource_group = module.resource_group.name
  address_space  = var.address_space
  tags           = var.tags
  environment    = var.environment
}

#snets

module "subnet" {
  source               = "../../../resources/azurerm/network/subnet"
  resource_group       = module.resource_group.name
  virtual_network_name = module.vnet_hub.virtual_network_name
  name_prefixes        = ["snet-dmz", "snet-bastion"]
  address_prefixes     = var.address_prefixes
  environment          = var.environment
}

#nsg

module "network_security_group" {
  source         = "../../../resources/azurerm/network/network_security_group"
  resource_group = module.resource_group.resource_group_name
  environment    = var.environment
  policy_name   = "RDPallow"
}
/*
module "nsg_association" {
  source                    = "../../../resources/azurerm/network/subnet_network_security_group_association"
  subnet_id                 = module.subnet_dmz.subnet_id
  network_security_group_id = element(module.nsg_dmz.nsg_id, 0)
}
*/

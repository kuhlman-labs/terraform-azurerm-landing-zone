###
#  module composition
###

#  resource group

module "resource_group" {
  source          = "../../../resources/azure/resource-group"
  resource_prefix = "network-hub"
  region          = var.region
  environment     = var.environment
}

#vnet

module "vnet_hub" {
  source              = "../../../resources/azure/network/vnet"
  resource_group      = module.resource_group.resource_group_name
  vnet_address_ranges = var.vnet_address_ranges
  tags                = var.tags
}

#subnets

module "subnet_dmz" {
  source                    = "../../../resources/azure/network/vnet-subnet"
  resource_group            = module.resource_group.resource_group_name
  vnet_name                 = module.vnet_hub.vnet_name
  subnet_name               = "dmz"
  subnet_address_prefix     = var.subnet_dmz_address_prefix
}

#nsg

module "nsg_dmz" {
  source         = "../../../resources/azure/network/nsg"
  resource_group = module.resource_group.resource_group_name
  environment    = var.environment
  subnet_names   = ["dmz"]
  nsg_rules      = var.nsg_rules_dmz
}

module "nsg_association_dmz" {
  source                    = "../../../resources/azure/network/nsg-association"
  subnet_id                 = module.subnet_dmz.subnet_id
  network_security_group_id = element(module.nsg_dmz.nsg_id, 0)
}
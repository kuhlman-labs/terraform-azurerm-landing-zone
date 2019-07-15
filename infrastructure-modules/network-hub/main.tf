###########################
# Setting up resource group
###########################

module "resource_group" {
  source          = "../../resource-modules/resource-group"
  resource_prefix = "network-hub"
  region          = var.region
  environment     = var.environment
}

#Setting up vnet

module "vnet_hub" {
  source              = "../../resource-modules/network/vnet"
  resource_group      = module.resource_group.resource_group_name
  vnet_address_ranges = var.vnet_address_ranges
  tags                = var.tags
}

#Setting up subnets

module "subnet_dmz" {
  source                    = "../../resource-modules/network/vnet-subnet"
  resource_group            = module.resource_group.resource_group_name
  vnet_name                 = module.vnet_hub.vnet_name
  subnet_name               = "dmz"
  subnet_address_prefix     = var.subnet_dmz_address_prefix
  network_security_group_id = element(module.nsg_dmz.nsg_id, 0)
}

#setting up nsg

module "nsg_dmz" {
  source         = "../../resource-modules/network/nsg"
  resource_group = module.resource_group.resource_group_name
  environment    = var.environment
  subnet_names   = ["dmz"]
  nsg_rules      = var.nsg_rules_dmz
}

module "nsg_association_dmz" {
  source                    = "../../resource-modules/network/nsg-association"
  subnet_id                 = module.subnet_dmz.subnet_id
  network_security_group_id = element(module.nsg_dmz.nsg_id, 0)
}
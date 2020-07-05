###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "bastion"
  region       = var.region
  environment  = var.environment
}

module "public_ip" {
  source            = "../../resources/network/public_ip"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  environment       = var.environment
  name_prefix       = "pip-bastion"
  allocation_method = "Static"
  sku               = "Standard"
  tags              = var.tags
}

module "bastion" {
  source                         = "../../resources/network/bastion_host"
  resource_group                 = module.resource_group.name
  region                         = module.resource_group.location
  address_prefix_bastion         = var.address_prefix_bastion
  environment                    = var.environment
  virtual_network_name           = var.virtual_network_name
  virtual_network_resource_group = var.virtual_network_resource_group
  public_ip_address_id           = module.public_ip.id
}
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

module "subnet" {
  source               = "../../resources/network/subnet"
  resource_group       = var.virtual_network_resource_group
  region               = module.resource_group.location
  virtual_network_name = var.virtual_network_name
  name_prefixes        = ["snet-bastion"]
  address_prefixes     = var.address_prefix_bastion
  environment          = var.environment
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
  source               = "../../resources/network/bastion_host"
  resource_group       = module.resource_group.name
  region               = module.resource_group.location
  environment          = var.environment
  subnet_id            = element(module.subnet.id, 0)
  public_ip_address_id = module.public_ip.id
}
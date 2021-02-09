###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "network-hub"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

#virtual network

module "virtual_network" {
  source         = "../../resources/network/virtual_network"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  environment    = var.environment
  name_prefix    = "vnet-hub"
  address_space  = var.address_space
  dns_servers    = var.dns_servers
  tags           = var.tags
}

#subnet

module "subnet" {
  source               = "../../resources/network/subnet"
  resource_group       = module.resource_group.name
  region               = module.resource_group.location
  virtual_network_name = module.virtual_network.name
  name_prefixes        = ["snet-agw"]
  address_prefixes     = var.address_prefix_agw
  environment          = var.environment
}

#bastion

module "public_ip_bastion" {
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
  virtual_network_name           = module.virtual_network.name
  virtual_network_resource_group = module.virtual_network.resource_group_name
  public_ip_address_id           = module.public_ip_bastion.id
}

#firewall

module "public_ip_fw" {
  source            = "../../resources/network/public_ip"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  environment       = var.environment
  name_prefix       = "pip-fw"
  allocation_method = "Static"
  sku               = "Standard"
  tags              = var.tags
}

module "firewall" {
  source               = "../../resources/network/firewall"
  resource_group       = module.resource_group.name
  region               = module.resource_group.location
  environment          = var.environment
  virtual_network_name = module.virtual_network.name
  public_ip_address_id = module.public_ip_fw.id
  address_prefixes     = var.address_prefix_fw
  tags                 = var.tags
}

#agw

module "public_ip_agw" {
  source            = "../../resources/network/public_ip"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  environment       = var.environment
  name_prefix       = "pip-agw"
  allocation_method = "Static"
  sku               = "Standard"
  tags              = var.tags
}

module "application_gateway" {
  source               = "../../resources/network/application_gateway"
  resource_group       = module.resource_group.name
  region               = module.resource_group.location
  name_prefix          = "agw-aks"
  sku_name             = "Standard_v2"
  sku_tier             = "Standard_v2"
  subnet_id            = element(module.subnet.id, 0)
  public_ip_address_id = module.public_ip_agw.id
  environment          = var.environment
  tags                 = var.tags
}

# DNS

module "dns_zone" {
  source = "../../resources/network/dns_zone"
  resource_group = module.resource_group.name
  domain_name = "kuhlman-labs.io"
}

module "dns_a_record" {
  source = "../../resources/network/dns_a_record"
  resource_group = module.resource_group.name
  a_record_name = "tailwindtraders"
  zone_name = module.dns_zone.name
  ttl = "360"
  target_resource_id = module.public_ip_agw.id
}
###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "network-transit-hub"
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
  name_prefix    = "vnet-transit-hub"
  address_space  = var.address_space
  dns_servers = var.dns_servers
  tags           = var.tags
}

#virtual gateway

module "public_ip_vgw" {
  source            = "../../resources/network/public_ip"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  environment       = var.environment
  name_prefix       = "pip-vgw"
  allocation_method = "Dynamic"
  sku               = "Basic"
  tags              = var.tags
}

module "virtual_network_gateway" {
  source                = "../../resources/network/virtual_network_gateway"
  resource_group        = module.resource_group.name
  region                = module.resource_group.location
  environment           = var.environment
  virtual_network_name  = module.virtual_network.name
  public_ip_name        = module.public_ip_vgw.name
  public_ip_address_id  = module.public_ip_vgw.id
  address_prefixes      = var.address_prefix_vgw
  type                  = var.vgw_type
  sku                   = var.vgw_sku
  vpn_client_protocols  = var.vpn_client_protocols
  address_space         = var.vpn_address_space
  root_certificate_name = "P2SRootCert"
  public_cert_data      = file("${path.module}/rootcertificate.cer")
  tags                  = var.tags
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
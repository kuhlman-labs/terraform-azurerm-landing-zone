###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "network-transit-hub"
  region       = var.region
  environment  = var.environment
}

#virtual network

module "virtual_network" {
  source         = "../../../resources/azurerm/network/virtual_network"
  resource_group = module.resource_group.name
  name_prefix    = "vnet-transit-hub"
  address_space  = var.address_space
  tags           = var.tags
  environment    = var.environment
  region         = module.resource_group.location
}

#virtual gateway

module "public_ip_vgw" {
  source            = "../../../resources/azurerm/network/public_ip"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  name_prefix       = "pip-vgw"
  allocation_method = "Dynamic"
  sku               = "Basic"
  environment       = var.environment
}

module "virtual_network_gateway" {
  source                = "../../../resources/azurerm/network/virtual_network_gateway"
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
}

#firewall

module "public_ip_fw" {
  source            = "../../../resources/azurerm/network/public_ip"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  name_prefix       = "pip-fw"
  allocation_method = "Static"
  sku               = "Standard"
  environment       = var.environment
}

module "firewall" {
  source               = "../../../resources/azurerm/network/firewall"
  resource_group       = module.resource_group.name
  region               = module.resource_group.location
  environment          = var.environment
  virtual_network_name = module.virtual_network.name
  public_ip_address_id = module.public_ip_fw.id
  address_prefixes     = var.address_prefix_fw
}
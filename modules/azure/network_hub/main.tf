###
#  module composition
###

#resource group

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
  name_prefix    = "vnet-hub"
  address_space  = var.address_space
  tags           = var.tags
  environment    = var.environment
}

#snets

module "subnet" {
  source               = "../../../resources/azurerm/network/subnet"
  resource_group       = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  name_prefixes        = var.subnet_name_prefixes
  address_prefixes     = var.subnet_address_prefixes
  environment          = var.environment
}

#nsg

module "network_security_group" {
  source         = "../../../resources/azurerm/network/network_security_group"
  resource_group = module.resource_group.name
  environment    = var.environment
  policy_name    = "rdpallow"
}

module "network_security_rule" {
  source                      = "../../../resources/azurerm/network/network_security_rule"
  resource_group              = module.resource_group.name
  network_security_group_name = module.network_security_group.name
  network_security_rules = [
    {
      name                       = "RDP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "3389"
      destination_port_range     = "3389"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    }
  ]
}

module "subnet_network_security_group_association" {
  source                    = "../../../resources/azurerm/network/subnet_network_security_group_association"
  subnet_id                 = var.subnet_id_management
  network_security_group_id = module.network_security_group.id
}

module "public_ip" {
  source            = "../../../resources/azurerm/network/public_ip"
  resource_group    = module.resource_group.name
  name_prefix       = "pip-vgw"
  allocation_method = "Dynamic"
  sku               = "Basic"
  environment       = var.environment
}

module "virtual_network_gateway" {
  source                = "../../../resources/azurerm/network/virtual_network_gateway"
  resource_group        = module.resource_group.name
  environment           = var.environment
  virtual_network_name  = module.virtual_network.name
  public_ip_name        = module.public_ip.name
  address_prefixes      = var.address_prefix_vgw
  type                  = "Vpn"
  sku                   = "Basic"
  vpn_client_protocols  = ["SSTP"]
  address_space         = ["192.168.100.0/24"]
  root_certificate_name = "P2SRootCert"
  public_cert_data      = file("${path.module}/rootcertificate.cer")
}
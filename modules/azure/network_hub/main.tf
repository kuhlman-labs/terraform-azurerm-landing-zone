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

#virtual network

module "virtual_network" {
  source         = "../../../resources/azurerm/network/virtual_network"
  resource_group = module.resource_group.name
  name_prefix    = "vnet-hub"
  address_space  = var.address_space
  tags           = var.tags
  environment    = var.environment
  region         = module.resource_group.location
}

#subnets

module "subnet" {
  source               = "../../../resources/azurerm/network/subnet"
  resource_group       = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  name_prefixes        = var.subnet_name_prefixes
  address_prefixes     = var.address_prefixes
  environment          = var.environment
  region               = module.resource_group.location
}

#network security groups

module "network_security_group" {
  source         = "../../../resources/azurerm/network/network_security_group"
  resource_group = module.resource_group.name
  environment    = var.environment
  region         = module.resource_group.location
  policy_name    = "rdpallow"
}

module "network_security_rule" {
  source                      = "../../../resources/azurerm/network/network_security_rule"
  resource_group              = module.resource_group.name
  region                      = module.resource_group.location
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
  source = "../../../resources/azurerm/network/subnet_network_security_group_association"
  subnet_id = element(matchkeys(module.subnet.id,
    module.subnet.name,
  list("management-${var.environment}-${module.resource_group.location}")), 0)
  network_security_group_id = module.network_security_group.id
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
  type                  = "Vpn"
  sku                   = "Basic"
  vpn_client_protocols  = ["SSTP"]
  address_space         = ["192.168.100.0/24"]
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

#firewall route table

module "route_table" {
  source         = "../../../resources/azurerm/network/route_table"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  environment    = var.environment
  name_prefix    = "route-firewall"
}

module "route" {
  source                 = "../../../resources/azurerm/network/route"
  resource_group         = module.resource_group.name
  region                 = module.resource_group.location
  environment            = var.environment
  route_table_name       = module.route_table.name
  route_name             = "firewall"
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = module.firewall.private_ip_address
}

module "subnet_route_table_association" {
  source         = "../../../resources/azurerm/network/subnet_route_table_association"
  route_table_id = module.route_table.id
  subnet_id = element(matchkeys(module.subnet.id,
    module.subnet.name,
  list("management-${var.environment}-${module.resource_group.location}")), 0)
}
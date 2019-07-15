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

#Setting up subnet

module "subnet_dmz" {
  source                    = "../../resource-modules/network/vnet-subnet"
  resource_group            = module.resource_group.resource_group_name
  vnet_name                 = module.vnet_hub.vnet_name
  subnet_name               = "dmz"
  subnet_address_prefix     = var.subnet_dmz_address_prefix
  network_security_group_id = element(module.nsg_dmz.nsg_id, 0)
}

module "subnet_gateway" {
  source                = "../../resource-modules/network/vnet-subnet"
  resource_group        = module.resource_group.resource_group_name
  vnet_name             = module.vnet_hub.vnet_name
  subnet_name           = "GatewaySubnet"
  subnet_address_prefix = var.subnet_gateway_address_prefix
}

module "subnet_firewall" {
  source                = "../../resource-modules/network/vnet-subnet"
  resource_group        = module.resource_group.resource_group_name
  vnet_name             = module.vnet_hub.vnet_name
  subnet_name           = "AzureFirewallSubnet"
  subnet_address_prefix = var.subnet_firewall_address_prefix
}

module "subnet_app_gw" {
  source                = "../../resource-modules/network/vnet-subnet"
  resource_group        = module.resource_group.resource_group_name
  vnet_name             = module.vnet_hub.vnet_name
  subnet_name           = "app_gw"
  subnet_address_prefix = var.subnet_app_gw_address_prefix
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

#Setting up vnet gateway

module "vnet_gateway" {
  source                = "../../resource-modules/network/vnet-gateway"
  resource_group        = module.resource_group.resource_group_name
  client_address_spaces = var.client_address_spaces
  vpn_client_protocols  = var.vpn_client_protocols
  gateway_subnet        = module.subnet_gateway.subnet_id
  region                = var.region
  environment           = var.environment
  tags                  = var.tags
}

#Setting up application gateway WAF

module "app_gw_waf" {
  source          = "../../resource-modules/network/application-gateway"
  resource_group  = module.resource_group.resource_group_name
  appgw_vnet_name = module.vnet_hub.vnet_name
  appgw_sku       = "WAF_v2"
  appgw_tier      = "WAF_v2"
  appgw_subnet_id = module.subnet_app_gw.subnet_id
  tags            = var.tags
}

#Setting up firewall

module "firewall" {
  source                              = "../../resource-modules/network/firewall"
  resource_group                      = module.resource_group.resource_group_name
  region                              = var.region
  environment                         = var.environment
  firewall_subnet_id                  = module.subnet_firewall.subnet_id
  firewall_collection_priority        = 200
  firewall_collection_action          = "Allow"
  firewall_rule_name                  = "AKSAllowTCPOutbound"
  firewall_rule_source_addresses      = ["*"]
  firewall_rule_destination_ports     = ["*"]
  firewall_rule_destination_addresses = ["*"]
  firewall_rule_protocols             = ["TCP"]
  tags                                = var.tags
}
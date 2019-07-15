##############################
# Shared Services Composistion
##############################

module "network_hub" {
  source = "../../infrastructure-modules/network-hub"
  #common
  environment = var.environment
  region      = var.region
  #vnet
  vnet_address_ranges = var.vnet_address_ranges
  #subnets
  subnet_gateway_address_prefix  = var.subnet_gateway_address_prefix
  subnet_firewall_address_prefix = var.subnet_firewall_address_prefix
  subnet_dmz_address_prefix      = var.subnet_dmz_address_prefix
  subnet_app_gw_address_prefix   = var.subnet_app_gw_address_prefix
  #nsg
  nsg_rules_dmz = var.nsg_rules_dmz
  #vnet-gw
  client_address_spaces = var.client_address_spaces
  vpn_client_protocols  = var.vpn_client_protocols
  #tags
  tags = var.tags
}
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
  subnet_dmz_address_prefix = var.subnet_dmz_address_prefix
  #nsg
  nsg_rules_dmz = var.nsg_rules_dmz
  #tags
  tags = var.tags
}
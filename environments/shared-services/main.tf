##############################
# Shared Services Composistion
##############################

module "network_hub" {
  source = "../../../modules/azure/network-hub"
  #common
  environment = var.environment
  region      = var.region
  #network
  vnet_address_ranges       = var.vnet_address_ranges
  subnet_dmz_address_prefix = var.subnet_dmz_address_prefix
  nsg_rules_dmz             = var.nsg_rules_dmz
  #tags
  tags = var.tags
}
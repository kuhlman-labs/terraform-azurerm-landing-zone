#######################
# Pre-Prod Composistion
#######################

module "network_spoke" {
  source = "../../infrastructure-modules/network-spoke"
  #common
  environment          = var.environment
  region               = var.region
  storage_account_name = var.storage_account_name
  access_key           = var.access_key
  shared_state_key     = replace(var.state_key, "pre-prod", "shared-services")
  container_name       = "tfstate"
  #vnet
  vnet_address_ranges            = var.vnet_address_ranges
  subnet_frontend_address_prefix = var.subnet_frontend_address_prefix
  subnet_backend_address_prefix  = var.subnet_backend_address_prefix
  route_address_prefix           = var.route_address_prefix
  #peering
  allow_forwarded_traffic     = "true"
  hub_allow_gateway_transit   = "true"
  hub_use_remote_gateways     = "false"
  spoke_allow_gateway_transit = "false"
  spoke_use_remote_gateways   = "true"
  #tags
  tags = var.tags
}

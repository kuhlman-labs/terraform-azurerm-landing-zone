#######################
# Pre-Prod Composistion
#######################

module "pre-prod-network-spoke" {
  source                      = "../../infrastructure-modules/network-spoke"
  resource_prefix             = "PRE-PROD-SPK"
  vnet_address_ranges         = var.vnet_address_ranges
  subnets_spoke               = var.subnets_spoke
  environment                 = var.environment
  region                      = var.region
  nsg_rules_edge              = var.nsg_rules
  nsg_rules_application       = var.nsg_rules
  nsg_rules_data              = var.nsg_rules
  storage_account_name        = var.storage_account_name
  access_key                  = var.access_key
  shared_state_key            = replace(var.state_key, "pre-prod", "shared-services")
  container_name              = "tfstate"
  allow_forwarded_traffic     = "true"
  hub_allow_gateway_transit   = "true"
  hub_use_remote_gateways     = "false"
  spoke_allow_gateway_transit = "false"
  spoke_use_remote_gateways   = "true"

  #TAGS#
  approver_tag       = var.approver_tag
  owner_tag          = var.owner_tag
  region_tag         = var.region_tag
  cost_center_tag    = var.cost_center_tag
  service_hours_tag  = var.service_hours_tag
  cloudreach_ops_tag = var.cloudreach_ops_tag
  optional_tags      = var.optional_tags
}


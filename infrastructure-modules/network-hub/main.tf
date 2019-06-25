#######################################
# Setting up Infra Modules for Hub vNet
#######################################

module "resource_group" {
  source          = "../../resource-modules/resource-group"
  resource_prefix = "NETWORK-HUB"
  region          = var.region
  environment     = var.environment
}

module "vnet-hub" {
  source              = "../../resource-modules/network/vnet"
  resource_group      = module.resource_group.resource_group_name
  vnet_address_ranges = var.vnet_address_ranges
  tier                = var.tier
  approver_tag        = var.approver_tag
  owner_tag           = var.owner_tag
  region_tag          = var.region_tag
  cost_center_tag     = var.cost_center_tag
  service_hours_tag   = var.service_hours_tag
  optional_tags       = var.optional_tags
}

module "vnet-subnets-hub" {
  source         = "../../resource-modules/network/vnet-subnets"
  resource_group = module.resource_group.resource_group_name
  vnet_name      = module.vnet-hub.vnet_name
  subnets        = var.subnets_hub
}

module "nsg-subnets-hub-dmz" {
  source         = "../../resource-modules/network/nsg"
  resource_group = module.resource_group.resource_group_name
  tier           = var.tier
  environment    = var.environment

  subnet_ids = matchkeys(
    module.vnet-subnets-hub.subnet_ids,
    module.vnet-subnets-hub.subnet_names,
    ["dmz"],
  )

  subnet_names = ["dmz"]
  nsg_rules    = var.nsg_rules_dmz
}

module "vnet-gateway-hub" {
  source         = "../../resource-modules/network/vnet-gateway"
  resource_group = module.resource_group.resource_group_name
  #certificate_data      = var.certificate_data
  client_address_spaces = var.client_address_spaces
  vpn_client_protocols  = var.vpn_client_protocols

  gateway_subnet = element(
    matchkeys(
      module.vnet-subnets-hub.subnet_ids,
      module.vnet-subnets-hub.subnet_names,
      ["GatewaySubnet"],
    ),
    0,
  )

  region            = var.region
  environment       = var.environment
  approver_tag      = var.approver_tag
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  service_hours_tag = var.service_hours_tag
  optional_tags     = var.optional_tags
}

module "firewall-hub" {
  source         = "../../resource-modules/network/firewall"
  resource_group = module.resource_group.resource_group_name
  region         = var.region
  environment    = var.environment
  firewall_subnet_id = element(
    matchkeys(
      module.vnet-subnets-hub.subnet_ids,
      module.vnet-subnets-hub.subnet_names,
      ["AzureFirewallSubnet"],
    ),
    0,
  )
  firewall_collection_priority        = 200
  firewall_collection_action          = "Allow"
  firewall_rule_name                  = "AKSAllowTCPOutbound"
  firewall_rule_source_addresses      = ["*"]
  firewall_rule_destination_ports     = ["*"]
  firewall_rule_destination_addresses = ["*"]
  firewall_rule_protocols             = ["TCP"]

  approver_tag      = var.approver_tag
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  service_hours_tag = var.service_hours_tag
  optional_tags     = var.optional_tags
}
#########################################
# Setting up Infra Modules for Spoke vNet
#########################################

module "resource_group" {
  source          = "../../resource-modules/resource-group"
  resource_prefix = var.resource_prefix
  region          = var.region
  environment     = var.environment
}

module "vnet-spoke" {
  source              = "../../resource-modules/network/vnet"
  resource_group      = module.resource_group.resource_group_name
  vnet_address_ranges = var.vnet_address_ranges
  tier                = var.tier
  approver_tag        = var.approver_tag
  owner_tag           = var.owner_tag
  region_tag          = var.region_tag
  cost_center_tag     = var.cost_center_tag
  service_hours_tag   = var.service_hours_tag
  cloudreach_ops_tag  = var.cloudreach_ops_tag
  optional_tags       = var.optional_tags
}

module "vnet-subnets-spoke" {
  source         = "../../resource-modules/network/vnet-subnets"
  resource_group = module.resource_group.resource_group_name
  vnet_name      = module.vnet-spoke.vnet_name
  subnets        = var.subnets_spoke
}

module "nsg-subnets-spoke-edge" {
  source         = "../../resource-modules/network/nsg"
  resource_group = module.resource_group.resource_group_name
  environment    = var.environment
  tier           = var.tier

  subnet_ids = matchkeys(
    module.vnet-subnets-spoke.subnet_ids,
    module.vnet-subnets-spoke.subnet_names,
    ["edge"],
  )

  subnet_names = ["edge"]
  nsg_rules    = var.nsg_rules_edge
}

module "nsg-subnets-spoke-application" {
  source         = "../../resource-modules/network/nsg"
  resource_group = module.resource_group.resource_group_name
  environment    = var.environment
  tier           = var.tier

  subnet_ids = matchkeys(
    module.vnet-subnets-spoke.subnet_ids,
    module.vnet-subnets-spoke.subnet_names,
    ["application"],
  )

  subnet_names = ["application"]
  nsg_rules    = var.nsg_rules_application
}

module "nsg-subnets-spoke-data" {
  source         = "../../resource-modules/network/nsg"
  resource_group = module.resource_group.resource_group_name
  environment    = var.environment
  tier           = var.tier

  subnet_ids = matchkeys(
    module.vnet-subnets-spoke.subnet_ids,
    module.vnet-subnets-spoke.subnet_names,
    ["data"],
  )

  subnet_names = ["data"]
  nsg_rules    = var.nsg_rules_data
}

#Pulling in remote state info from shared-services stack for peering
data "terraform_remote_state" "vnet-hub" {
  backend = "azurerm"

  config = {
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.shared_state_key
    access_key           = var.access_key
  }
}

module "vnet-peering" {
  source                      = "../../resource-modules/network/vnet-peering"
  hub_vnet_name               = data.terraform_remote_state.vnet-hub.outputs.shared_vnet_hub_name
  hub_vnet_rg                 = data.terraform_remote_state.vnet-hub.outputs.shared_vnet_hub_rg
  hub_vnet_id                 = data.terraform_remote_state.vnet-hub.outputs.shared_vnet_hub_id
  spoke_vnet_name             = module.vnet-spoke.vnet_name
  spoke_vnet_id               = module.vnet-spoke.vnet_id
  spoke_vnet_rg               = module.resource_group.resource_group_name
  allow_forwarded_traffic     = var.allow_forwarded_traffic
  hub_allow_gateway_transit   = var.hub_allow_gateway_transit
  hub_use_remote_gateways     = var.hub_use_remote_gateways
  spoke_allow_gateway_transit = var.spoke_allow_gateway_transit
  spoke_use_remote_gateways   = var.spoke_use_remote_gateways
}


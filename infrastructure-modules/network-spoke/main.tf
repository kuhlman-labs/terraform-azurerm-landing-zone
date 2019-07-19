#Pulling in outputs form shared-services stack for peering

data "terraform_remote_state" "shared_services" {
  backend = "azurerm"

  config = {
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.shared_state_key
    access_key           = var.access_key
  }
}

# Setting up resource group

module "resource_group" {
  source          = "../../resource-modules/resource-group"
  resource_prefix = "network-spoke"
  region          = var.region
  environment     = var.environment
}

#Setting up vnet

module "vnet_spoke" {
  source              = "../../resource-modules/network/vnet"
  resource_group      = module.resource_group.resource_group_name
  vnet_address_ranges = var.vnet_address_ranges
  tags                = var.tags
}

#Setting up subnets

module "subnet_frontend" {
  source                = "../../resource-modules/network/vnet-subnet"
  resource_group        = module.resource_group.resource_group_name
  vnet_name             = module.vnet_spoke.vnet_name
  subnet_name           = "frontend"
  subnet_address_prefix = var.subnet_frontend_address_prefix
}

module "subnet_backend" {
  source                = "../../resource-modules/network/vnet-subnet"
  resource_group        = module.resource_group.resource_group_name
  vnet_name             = module.vnet_spoke.vnet_name
  subnet_name           = "backend"
  subnet_address_prefix = var.subnet_backend_address_prefix
}

#Setting up vnet peering

module "vnet_peering" {
  source                      = "../../resource-modules/network/vnet-peering"
  hub_vnet_name               = data.terraform_remote_state.shared_services.outputs.shared_services_vnet_name
  hub_vnet_rg                 = data.terraform_remote_state.shared_services.outputs.shared_services_vnet_rg
  hub_vnet_id                 = data.terraform_remote_state.shared_services.outputs.shared_services_vnet_id
  spoke_vnet_name             = module.vnet_spoke.vnet_name
  spoke_vnet_id               = module.vnet_spoke.vnet_id
  spoke_vnet_rg               = module.resource_group.resource_group_name
  allow_forwarded_traffic     = var.allow_forwarded_traffic
  hub_allow_gateway_transit   = var.hub_allow_gateway_transit
  hub_use_remote_gateways     = var.hub_use_remote_gateways
  spoke_allow_gateway_transit = var.spoke_allow_gateway_transit
  spoke_use_remote_gateways   = var.spoke_use_remote_gateways
}
###
# environment composition
###

data "terraform_remote_state" "shared_services" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstate000eus"
    container_name       = "tfstate"
    key                  = "shared-services.tfstate"
  }
}

module "network_spoke" {
  source                                  = "../../modules/network_spoke"
  environment                             = var.environment
  region                                  = var.region
  address_space                           = var.address_space
  virtual_network_hub_resource_group_name = data.terraform_remote_state.shared_services.outputs.network_hub_resource_group_name
  virtual_network_hub_name                = data.terraform_remote_state.shared_services.outputs.network_hub_name
  virtual_network_hub_id                  = data.terraform_remote_state.shared_services.outputs.network_hub_id
  allow_gateway_transit_hub               = false
  allow_gateway_transit_spoke             = false
  use_remote_gateways_spoke               = false
  use_remote_gateways_hub                 = false
  tags                                    = var.tags
}

module "aks_baseline" {
  source                         = "../../modules/aks_baseline"
  environment                    = var.environment
  region                         = var.region
  virtual_network_resource_group = module.network_spoke.virtual_network_resource_group_name
  virtual_network_name           = module.network_spoke.virtual_network_name
  address_prefix_aks             = var.address_prefix_aks
  dns_service_ip                 = var.dns_service_ip
  docker_bridge_cidr             = var.docker_bridge_cidr
  service_cidr                   = var.service_cidr
  tags                           = var.tags
  log_analytics_workspace_id     = data.terraform_remote_state.shared_services.outputs.log_analytics_id
}
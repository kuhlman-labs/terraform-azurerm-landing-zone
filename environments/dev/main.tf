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
    subscription_id      = var.subscription_id
    client_id            = var.client_id
    client_secret        = var.client_secret
    tenant_id            = var.tenant_id
  }
}

module "network_spoke" {
  source                                  = "../../modules/network_spoke"
  environment                             = var.environment
  region                                  = var.region
  address_space                           = var.address_space
  subscription_id                         = var.subscription_id
  client_id                               = var.client_id
  client_secret                           = var.client_secret
  tenant_id                               = var.tenant_id
  virtual_network_hub_resource_group_name = data.terraform_remote_state.shared_services.outputs.network_hub_resource_group_name
  virtual_network_hub_name                = data.terraform_remote_state.shared_services.outputs.network_hub_name
  virtual_network_hub_id                  = data.terraform_remote_state.shared_services.outputs.network_hub_id
  allow_gateway_transit_hub               = false
  allow_gateway_transit_spoke             = false
  use_remote_gateways_spoke               = false
  use_remote_gateways_hub                 = false
  tags                                    = var.tags
}

module "k8s_cluster" {
  source                         = "../../modules/k8s_cluster"
  environment                    = var.environment
  region                         = var.region
  virtual_network_resource_group = module.network_spoke.virtual_network_resource_group_name
  virtual_network_name           = module.network_spoke.virtual_network_name
  address_prefix_k8s_master      = var.address_prefix_k8s_master
  address_prefix_k8s_node        = var.address_prefix_k8s_node
}

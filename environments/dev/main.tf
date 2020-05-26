###
# environment composition
###

data "terraform_remote_state" "shared_services" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = var.storage_account_name
    container_name       = "tfstate"
    key                  = "shared-services.tfstate"
  }
}

module "network_spoke" {
  source                                  = "../../modules/azure/network_spoke"
  environment                             = var.environment
  region                                  = var.region
  address_space                           = var.address_space
  address_prefixes                        = var.address_prefixes
  virtual_network_hub_resource_group_name = data.terraform_remote_state.shared_services.outputs.network_hub_resource_group_name
  virtual_network_hub_name                = data.terraform_remote_state.shared_services.outputs.network_hub_name
  virtual_network_hub_id                  = data.terraform_remote_state.shared_services.outputs.network_hub_id
  subnet_name_prefixes                    = var.subnet_name_prefixes
  tags                                    = var.tags
}

module "aks_agw_ingress" {
  source = "../../modules/azure/aks_agw_ingress"

  environment   = var.environment
  region        = var.region
  client_secret = var.client_secret
  app_id        = var.app_id
  object_id     = var.object_id
  subnet_id_agw = element(matchkeys(module.network_spoke.subnet_id,
    module.network_spoke.subnet_name,
  list("snet-agw-${var.environment}-${var.region}")), 0)
  subnet_id_aks = element(matchkeys(module.network_spoke.subnet_id,
    module.network_spoke.subnet_name,
  list("snet-aks-${var.environment}-${var.region}")), 0)
  dns_service_ip     = var.dns_service_ip
  docker_bridge_cidr = var.docker_bridge_cidr
  service_cidr       = var.service_cidr

  tags = var.tags
}

module "linux_web_app" {
  source = "../../modules/azure/linux_web_app"
  environment   = var.environment
  region        = var.region
}
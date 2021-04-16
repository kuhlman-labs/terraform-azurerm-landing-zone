###
# environment composition
###

module "network_hub" {
  source                 = "../../modules/network_hub"
  environment            = var.environment
  region                 = var.region
  address_space          = var.address_space
  tags                   = var.tags
  address_prefix_agw     = var.address_prefix_agw
  address_prefix_fw      = var.address_prefix_fw
  address_prefix_bastion = var.address_prefix_bastion
}

module "audit_logs" {
  source      = "../../modules/logs"
  environment = var.environment
  region      = var.region
}

module "aks_baseline" {
  source                         = "../../modules/aks_baseline"
  environment                    = var.environment
  region                         = var.region
  virtual_network_resource_group = module.network_hub.virtual_network_resource_group_name
  virtual_network_name           = module.network_hub.virtual_network_name
  address_prefix_aks             = var.address_prefix_aks
  dns_service_ip                 = var.dns_service_ip
  docker_bridge_cidr             = var.docker_bridge_cidr
  service_cidr                   = var.service_cidr
  tags                           = var.tags
  log_analytics_workspace_id     = module.audit_logs.log_analytics_id
}

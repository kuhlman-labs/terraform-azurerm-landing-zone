###
# environment composition
###

module "network_isolated" {
  source        = "../../modules/network_isolated"
  environment   = var.environment
  region        = var.region
  address_space = var.address_space
  tags          = var.tags
}

module "audit_logs" {
  source      = "../../modules/audit_logs"
  environment = var.environment
  region      = var.region
}


module "aks_baseline" {
  source                         = "../../modules/aks_baseline"
  environment                    = var.environment
  region                         = var.region
  virtual_network_resource_group = module.network_isolated.virtual_network_resource_group_name
  virtual_network_name           = module.network_isolated.virtual_network_name
  address_prefix_aks             = var.address_prefix_aks
  dns_service_ip                 = var.dns_service_ip
  docker_bridge_cidr             = var.docker_bridge_cidr
  service_cidr                   = var.service_cidr
  tags                           = var.tags
  log_analytics_workspace_id     = module.audit_logs.log_analytics_id
}

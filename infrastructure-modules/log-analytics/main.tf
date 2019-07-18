module "resource_group" {
  source          = "../../resource-modules/resource-group"
  resource_prefix = "log-analytics"
  region          = var.region
  environment     = var.environment
}

module "log-analytics" {
  source         = "../../resource-modules/governance/log-analytics"
  resource_group = module.resource_group.resource_group_name
  tags           = var.tags
}


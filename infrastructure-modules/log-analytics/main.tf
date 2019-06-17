module "resource_group" {
  source          = "../../resource-modules/resource-group"
  resource_prefix = var.resource_prefix
  region          = var.region
  environment     = var.environment
}

module "log-analytics" {
  source            = "../../resource-modules/governance/log-analytics"
  resource_group    = module.resource_group.resource_group_name
  retention_period  = var.retention_period
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  approver_tag      = var.approver_tag
  service_hours_tag = var.service_hours_tag

  optional_tags = var.optional_tags
}


# Log Analytics Workspace for Activity Log

/*

module "log-analytics" {
  source           = "../../infrastructure-modules/log-analytics"
  region           = var.region
  environment      = var.environment
  retention_period = "90"
  resource_prefix  = "AUD-LOGAW"

  #TAGS#
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  approver_tag      = var.approver_tag
  service_hours_tag = var.service_hours_tag

  optional_tags = var.optional_tags
}

*/
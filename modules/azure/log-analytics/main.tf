###
#  module composition
###

module "resource_group" {
  source          = "../../../resources/azure/resource-group"
  name_prefix = "log-analytics"
  region          = var.region
  environment     = var.environment
}

module "log-analytics" {
  source         = "../../../resources/azure/governance/log-analytics"
  resource_group = module.resource_group.resource_group_name
  tags           = var.tags
}


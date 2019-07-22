####################
# Audit Composistion
####################

module "log_analytics" {
  source           = "../../../modules/azure/log-analytics"
  environment      = var.environment
  region           = var.region
  retention_period = "90"
  tags             = var.tags
}
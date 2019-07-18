####################
# Audit Composistion
####################

module "log_analytics" {
  source           = "../../infrastructure-modules/log-analytics"
  environment      = var.environment
  region           = var.region
  retention_period = "90"
  tags             = var.tags
}
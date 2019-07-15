####################
# Audit Composistion
####################

module "log_analytics" {
  source = "../../infrastructure-modules/log-analytics"
  #common
  environment = var.environment
  region      = var.region
  #log-aw
  retention_period = "90"
  #tags
  tags = var.tags
}
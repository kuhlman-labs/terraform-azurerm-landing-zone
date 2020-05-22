###
# environment composition
###

module "audit_logs" {
  source      = "../../modules/azure/audit_logs"
  environment = var.environment
  region      = var.region
}

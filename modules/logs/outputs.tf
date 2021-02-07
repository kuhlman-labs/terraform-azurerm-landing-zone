###
#  module outputs
###

output "log_analytics_id" {
  value       = module.log_analytics.id
  description = "Log Analytics Workspace id"
}
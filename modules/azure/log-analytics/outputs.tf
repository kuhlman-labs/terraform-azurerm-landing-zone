###
#  module outputs
###

output "log_analytics_id" {
  value       = module.log-analytics.log_analytics_id
  description = "log analytics resource id"
}

output "log_analytics_primary_shared_key" {
  value       = module.log-analytics.log_analytics_primary_shared_key
  description = "primary shared key for the Log Analytics Workspace"
}

output "log_analytics_workspace_id" {
  value       = module.log-analytics.log_analytics_workspace_id
  description = "workspace (or customer) ID for the log analytics workspace"
}


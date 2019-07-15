output "log_analytics_id" {
  value       = azurerm_log_analytics_workspace.base.*.id
  description = "Log Analytics Workspace id"
}

output "log_analytics_primary_shared_key" {
  value       = azurerm_log_analytics_workspace.base.*.primary_shared_key
  description = "Primary shared key for the Log Analytics Workspace"
}

output "log_analytics_workspace_id" {
  value       = azurerm_log_analytics_workspace.base.*.workspace_id
  description = "Workspace (or Customer) ID for the Log Analytics Workspace"
}


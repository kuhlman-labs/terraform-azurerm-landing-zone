###
# environment outputs
###

output "network_hub_name" {
  value       = module.network_hub.virtual_network_name
  description = "Generated name of the transit hub virtual network"
}

output "network_hub_id" {
  value       = module.network_hub.virtual_network_id
  description = "Resource id of the transit hub virtual network"
}

output "network_hub_resource_group_name" {
  value       = module.network_hub.virtual_network_resource_group_name
  description = "Generated name of the resource group for the transit hub virtual network"
}

output "log_analytics_id" {
  value       = module.logging.log_analytics_id
  description = "Log Analytics Workspace ID"
}

output "firewall_private_ip_address" {
  value       = module.network_hub.firewall_private_ip_address
  description = "The private IP address of the Azure Firewall."
}
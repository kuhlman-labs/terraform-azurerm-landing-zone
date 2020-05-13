###
# environment outputs
###

output "network_hub_name" {
  value       = module.network_hub.virtual_network_name
  description = "Generated name of the hub virtual network"
}

output "network_hub_id" {
  value       = module.network_hub.virtual_network_id
  description = "Resource id of the hub virtual network"
}

output "network_hub_resource_group_name" {
  value       = module.network_hub.virtual_network_resource_group_name
  description = "Generated name of the resource group for hub virtual network"
}
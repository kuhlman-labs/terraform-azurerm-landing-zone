###
#  module outputs
###

output "virtual_network_name" {
  value       = module.virtual_network.name
  description = "resource name of vnet hub"
}

output "virtual_network_id" {
  value       = module.virtual_network.id
  description = "resource id of vnet hub"
}

output "virtual_network_resource_group_name" {
  value = module.virtual_network.resource_group_name
}

output "firewall_private_ip_address" {
  value       = module.firewall.private_ip_address
  description = "The private IP address of the Azure Firewall."
}
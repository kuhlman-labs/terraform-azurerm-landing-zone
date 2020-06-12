###
#  module outputs
###

output "virtual_network_name" {
  value       = module.virtual_network.name
  description = "The name of the virtual network."
}

output "virtual_network_id" {
  value       = module.virtual_network.id
  description = "The virtual NetworkConfiguration ID."
}

output "virtual_network_resource_group_name" {
  value       = module.virtual_network.resource_group_name
  description = "The name of the resource group of the virtual network."
}

output "virtual_network_gateway_id" {
  value       = module.virtual_network_gateway.id
  description = "The ID of the Virtual Network Gateway."
}

output "firewall_id" {
  value       = module.firewall.id
  description = "The Resource ID of the Azure Firewall."
}

output "firewall_private_ip_address" {
  value       = module.firewall.private_ip_address
  description = "The private IP address of the Azure Firewall."
}
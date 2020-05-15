###
#  module outputs
###

output "virtual_network_name" {
  value       = module.virtual_network.name
  description = "resource name of virtual network"
}

output "virtual_network_id" {
  value       = module.virtual_network.id
  description = "resource id of virtual network"
}

output "virtual_network_resource_group_name" {
  value = module.virtual_network.resource_group_name
  description = "resource group name of virtual network"
}

output "subnet_id" {
  value       = module.subnet.id
  description = "The subnet ID."
}

output "subnet_name" {
  value       = module.subnet.name
  description = "The subnet ID."
}
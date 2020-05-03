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
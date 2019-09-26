###
# environment outputs
###

output "test_vnet_name" {
  value       = module.network_hub.vnet_hub_name
  description = "Generated name of the hub virtual network"
}

output "test_vnet_id" {
  value       = module.network_hub.vnet_hub_id
  description = "Resource id of the hub virtual network"
}

output "test_vnet_rg" {
  value       = module.network_hub.vnet_hub_rg
  description = "Generated name of the resource group for hub virtual network"
}
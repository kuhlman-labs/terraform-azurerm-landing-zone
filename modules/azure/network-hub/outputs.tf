###
#  module outputs
###

output "vnet_hub_name" {
  value       = module.vnet_hub.vnet_name
  description = "resource name of vnet hub"
}

output "vnet_hub_id" {
  value       = module.vnet_hub.vnet_id
  description = "resource id of vnet hub"
}

output "vnet_hub_rg" {
  value       = module.vnet_hub.vnet_rg_name
  description = "resource group name of vnet hub"
}

output "subnet_dmz_id" {
  value       = module.subnet_dmz.subnet_id
  description = "resource id for dmz subnet"
}

output "subnet_dmz_name" {
  value       = module.subnet_dmz.name_prefix
  description = "resource name for dmz subnet"
}
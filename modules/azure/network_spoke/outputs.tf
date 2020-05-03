###
#  module outputs
###

output "vnet_spoke_name" {
  value       = module.vnet_spoke.vnet_name
  description = "resource name for spoke vnet"
}

output "vnet_spoke_id" {
  value       = module.vnet_spoke.vnet_id
  description = "resource id for spoke vnet"
}

output "vnet_spoke_rg" {
  value       = module.vnet_spoke.vnet_rg_name
  description = "resource group name for spkoke vnet"
}

output "subnet_frontend_id" {
  value       = module.subnet_frontend.subnet_id
  description = "resource id for frontend subnet"
}

output "subnet_frontend_name" {
  value       = module.subnet_frontend.name_prefix
  description = "resource name for frontend subnet"
}

output "subnet_backend_id" {
  value       = module.subnet_backend.subnet_id
  description = "resource id for backend subnet"
}

output "subnet_backend_name" {
  value       = module.subnet_backend.name_prefix
  description = "resource name for backend subnet"
}
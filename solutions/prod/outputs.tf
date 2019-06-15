output "prod_vnet_spoke_name" {
  value       = module.prod-network-spoke.vnet_spoke_name
  description = "Generated name of the Virtual Network"
}

output "prod_vnet_spoke_rg" {
  value       = module.prod-network-spoke.vnet_spoke_rg
  description = "Generated name of the Virtual Network resource group"
}


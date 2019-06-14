output "vnet_spoke_name" {
  value       = "${module.vnet-spoke.vnet_name}"
  description = "Generated spoke vnet name"
}

output "vnet_spoke_id" {
  value       = "${module.vnet-spoke.vnet_id}"
  description = "Resource id of created spoke vnet"
}

output "vnet_spoke_rg" {
  value       = "${module.vnet-spoke.vnet_rg_name}"
  description = "Generated spoke resource group name"
}

output "vnet_subnets_spoke_id" {
  value       = "${module.vnet-subnets-spoke.subnet_ids}"
  description = "List of spoke subnets resource ids"
}

output "vnet_subnets_names" {
  value       = "${module.vnet-subnets-spoke.subnet_names}"
  description = "List of spoke subnet names"
}

output "vnet_hub_to_spoke_peering_id" {
  value       = "${module.vnet-peering.vnet_hub_to_spoke_peering_id}"
  description = "Resource id for peering between hub and spoke vnet"
}

output "vnet_spoke_to_hub_peering_id" {
  value       = "${module.vnet-peering.vnet_hub_to_spoke_peering_id}"
  description = "Resource id for peering between spoke and hub vnet"
}

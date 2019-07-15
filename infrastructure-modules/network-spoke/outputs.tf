output "vnet_spoke_name" {
  value       = module.vnet_spoke.vnet_name
  description = "Generated spoke vnet name"
}

output "vnet_spoke_id" {
  value       = module.vnet_spoke.vnet_id
  description = "Resource id of created spoke vnet"
}

output "vnet_spoke_rg" {
  value       = module.vnet_spoke.vnet_rg_name
  description = "Generated spoke resource group name"
}

output "subnet_aks_nodes_id" {
  value = module.subnet_aks_nodes.subnet_id
}

output "subnet_aks_nodes_name" {
  value = module.subnet_aks_nodes.subnet_name
}

output "subnet_virtual_node_aci_id" {
  value = module.subnet_virtual_node_aci.subnet_id
}

output "subnet_virtual_node_aci_name" {
  value = module.subnet_virtual_node_aci.subnet_name
}
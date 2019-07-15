output "shared_services_vnet_name" {
  value       = module.network_hub.vnet_hub_name
  description = "Generated name of the hub virtual network"
}

output "shared_services_vnet_id" {
  value       = module.network_hub.vnet_hub_id
  description = "Resource id of the hub virtual network"
}

output "shared_services_subnet_app_gw_id" {
  value = module.network_hub.subnet_app_gw_id
}


output "shared_services_vnet_rg" {
  value       = module.network_hub.vnet_hub_rg
  description = "Generated name of the resource group for hub virtual network"
}

output "shared_services_firewall_private_ip" {
  value = module.network_hub.firewall_private_ip
}

output "shared_services_firewall_public_ip" {
  value = module.network_hub.firewall_public_ip
}

output "shared_services_appgw_id" {
  value = module.network_hub.appgw_id
}
output "vnet_hub_name" {
  value       = module.vnet_hub.vnet_name
  description = "Generated hub vnet name"
}

output "vnet_hub_id" {
  value       = module.vnet_hub.vnet_id
  description = "Resource id of hub vnet"
}

output "vnet_hub_rg" {
  value       = module.vnet_hub.vnet_rg_name
  description = "Generated hub resource group name"
}

output "subnet_dmz_id" {
  value = module.subnet_dmz.subnet_id
}

output "subnet_dmz_name" {
  value = module.subnet_dmz.subnet_name
}

output "subnet_gateway_id" {
  value = module.subnet_gateway.subnet_id
}

output "subnet_firewall_id" {
  value = module.subnet_firewall.subnet_id
}

output "subnet_app_gw_id" {
  value = module.subnet_app_gw.subnet_id
}

output "gateway_id" {
  value       = module.vnet_gateway.vnet_gateway_id
  description = "Virtual network gateway resource id"
}

output "firewall_private_ip" {
  value = module.firewall.firewall_private_ip
}

output "firewall_public_ip" {
  value = module.firewall.firewall_public_ip
}

output "firewall_id" {
  value = module.firewall.firewall_id
}

output "appgw_id" {
  value = module.app_gw_waf.appgw_id
}
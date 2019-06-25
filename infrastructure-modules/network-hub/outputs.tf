output "vnet_hub_name" {
  value       = module.vnet-hub.vnet_name
  description = "Generated hub vnet name"
}

output "vnet_hub_id" {
  value       = module.vnet-hub.vnet_id
  description = "Resource id of hub vnet"
}

output "vnet_hub_rg" {
  value       = module.vnet-hub.vnet_rg_name
  description = "Generated hub resource group name"
}

output "vnet_subnets_hub_id" {
  value       = module.vnet-subnets-hub.subnet_ids
  description = "List of hub subnets resource ids"
}

output "vnet_subnets_hub_name" {
  value       = module.vnet-subnets-hub.subnet_names
  description = "List of hub subnet names"
}

output "vnet_gateway_hub_id" {
  value       = module.vnet-gateway-hub.vnet_gateway_id
  description = "Virtual network gateway resource id"
}

output "vnet_subnets_hub_dmz_nsg" {
  value       = module.nsg-subnets-hub-dmz.nsg_id
  description = "DMZ network security group resource id"
}

output "firewall_hub_private_ip" {
  value = module.firewall-hub.firewall_private_ip
}

output "firewall_hub_public_ip" {
  value = module.firewall-hub.firewall_public_ip
}

output "firewall_hub_id" {
  value = module.firewall-hub.firewall_id
}

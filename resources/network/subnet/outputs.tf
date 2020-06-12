###
# resource outputs
###

output "id" {
  value       = azurerm_subnet.base[*].id
  description = "The subnet ID."
}

output "name" {
  value       = azurerm_subnet.base[*].name
  description = "The name of the subnet."
}

output "resource_group_name" {
  value       = azurerm_subnet.base[*].resource_group_name
  description = "The name of the resource group in which the subnet is created in."
}

output "virtual_network_name" {
  value       = azurerm_subnet.base[*].virtual_network_name
  description = "The name of the virtual network in which the subnet is created in"
}

output "address_prefixes" {
  value       = azurerm_subnet.base[*].address_prefixes
  description = "The address prefixes for the subnet"
}
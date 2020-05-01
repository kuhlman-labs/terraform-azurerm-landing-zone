###
# resource outputs
###

output "resource_group_name" {
  value       = data.azurerm_resource_group.base.name
  description = "The name of the resource group in which to create the virtual network."
}

output "resource_group_id" {
  value       = data.azurerm_resource_group.base.id
  description = "Resource group id for virtual network"
}

output "virtual_network_name" {
  value       = azurerm_virtual_network.base.name
  description = "The name of the virtual network."
}

output "virtual_network_id" {
  value       = azurerm_virtual_network.base.id
  description = "The virtual NetworkConfiguration ID."
}

output "virtual_network_address_space" {
  value       = azurerm_virtual_network.base.address_space
  description = "The address space that is used the virtual network."
}
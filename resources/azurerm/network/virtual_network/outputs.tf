###
# resource outputs
###

output "resource_group_name" {
  value       = azurerm_virtual_network.base.resource_group_name
  description = "The name of the resource group in which to create the virtual network."
}

output "name" {
  value       = azurerm_virtual_network.base.name
  description = "The name of the virtual network."
}

output "id" {
  value       = azurerm_virtual_network.base.id
  description = "The virtual NetworkConfiguration ID."
}

output "address_space" {
  value       = azurerm_virtual_network.base.address_space
  description = "The address space that is used the virtual network."
}
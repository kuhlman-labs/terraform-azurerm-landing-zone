###
# resource outputs
###

output "subnet_id" {
  value = azurerm_subnet.base.id
}

output "subnet_name" {
  value = azurerm_subnet.base.name
}

output "subnet_resource_group_name" {
  value = azurerm_subnet.base.resource_group_name
}

output "subnet_virtual_network_name" {
  value = azurerm_subnet.base.virtual_network_name
}

output "subnet_address_prefix" {
  value = azurerm_subnet.base.address_prefix
}
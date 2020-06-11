###
# resource outputs
###

output "id" {
  value       = azurerm_linux_virtual_machine.base[*].id
  description = "The ID of the Linux Virtual Machine."
}

output "name" {
  value       = azurerm_linux_virtual_machine.base[*].name
  description = "The Name of the Linux Virtual Machine."
}

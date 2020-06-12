###
# resource outputs
###

output "id" {
  value       = azurerm_windows_virtual_machine.base[*].id
  description = "The ID of the Windows Virtual Machine."
}

output "name" {
  value       = azurerm_windows_virtual_machine.base[*].name
  description = "The Name of the Windows Virtual Machine."
}

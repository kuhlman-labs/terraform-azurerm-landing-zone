###
# resource outputs
###

output "id" {
  value       = azurerm_windows_virtual_machine.base[*].id
  description = "The ID of the Windows Virtual Machine."
}

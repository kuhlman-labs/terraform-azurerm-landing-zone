###
# resource outputs
###

output "id" {
  value       = azurerm_virtual_machine_data_disk_attachment.base.id
  description = "The ID of the Virtual Machine Data Disk attachment."
}
###
# resource outputs
###

output "id" {
  value       = azurerm_managed_disk.base.id
  description = "The ID of the Managed Disk."
}
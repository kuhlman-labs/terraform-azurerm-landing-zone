###
# resource outputs
###

output "id" {
  value       = azurerm_network_security_group.base.id
  description = "The ID of the Network Security Group."
}
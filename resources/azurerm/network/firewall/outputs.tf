###
# resource outputs
###

output "id" {
  value       = azurerm_firewall.base.id
  description = "The Resource ID of the Azure Firewall."
}

output "private_ip_address" {
  value       = azurerm_firewall.base.ip_configuration.0.private_ip_address
  description = "The private IP address of the Azure Firewall."
}
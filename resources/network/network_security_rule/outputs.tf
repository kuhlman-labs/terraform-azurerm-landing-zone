###
# resource outputs
###

output "id" {
  value       = azurerm_network_security_rule.base[*].id
  description = "The ID of the Network Security Rule."
}


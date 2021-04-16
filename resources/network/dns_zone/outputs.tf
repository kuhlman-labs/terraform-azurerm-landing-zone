###
# resource outputs
###

output "id" {
  value       = azurerm_dns_zone.base.id
  description = "The DNS Zone ID."
}

output "name" {
  value       = azurerm_dns_zone.base.name
  description = "The DNS Zone Name."
}


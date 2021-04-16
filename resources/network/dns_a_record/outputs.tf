###
# resource outputs
###

output "id" {
  value       = azurerm_dns_a_record.base.id
  description = "The DNS A Record ID."
}

output "fqdn" {
  value       = azurerm_dns_a_record.base.fqdn
  description = "The FQDN of the DNS A Record."
}


###
# resource outputs
###

output "id" {
  value       = azurerm_public_ip.base.id
  description = "The Public IP ID."
}

output "ip_address" {
  value       = azurerm_public_ip.base.ip_address
  description = "The IP address value that was allocated. Note Dynamic Public IP Addresses aren't allocated until they're attached to a device"
}

output "fqdn" {
  value       = azurerm_public_ip.base.fqdn
  description = "Fully qualified domain name of the A DNS record associated with the public IP. domain_name_label must be specified to get the fqdn. This is the concatenation of the domain_name_label and the regionalized DNS zone"
}

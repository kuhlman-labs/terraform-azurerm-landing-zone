###
# resource outputs
###

output "id" {
  value = azurerm_firewall.base.id
}
output "private_ip_address" {
  value = azurerm_firewall.base.ip_configuration.0.private_ip_address
}
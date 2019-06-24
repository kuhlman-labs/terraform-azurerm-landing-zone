output "firewall_id" {
  value = azurerm_firewall.base.id
}
output "firewall_private_ip" {
  value = azurerm_firewall.base.ip_configuration.0.private_ip_address
}


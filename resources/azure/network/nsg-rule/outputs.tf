output "rules_id" {
  value       = azurerm_network_security_rule.base.*.id
  description = "List of network security group rules ids"
}
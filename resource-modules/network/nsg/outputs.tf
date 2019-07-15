output "nsg_id" {
  value       = azurerm_network_security_group.base.*.id
  description = "Network security group resource id"
}

output "nsg_rules_ids" {
  value       = azurerm_network_security_rule.base.*.id
  description = "List of network security group rules ids"
}


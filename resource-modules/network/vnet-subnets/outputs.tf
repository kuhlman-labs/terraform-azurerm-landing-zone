output "subnet_ids" {
  value       = azurerm_subnet.main.*.id
  description = "List of created subnets ids"
}

output "subnet_names" {
  value       = azurerm_subnet.main.*.name
  description = "List of created subnets names"
}


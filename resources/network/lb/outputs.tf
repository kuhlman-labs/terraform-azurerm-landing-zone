###
# resource outputs
###

output "id" {
  value       = azurerm_lb.base.id
  description = "The Load Balancer ID."
}
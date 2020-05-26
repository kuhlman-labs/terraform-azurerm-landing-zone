###
# resource outputs
###

output "id" {
  value       = azurerm_lb_backend_address_pool.base.id
  description = "The ID of the Backend Address Pool."
}
###
# resource outputs
###

output "id" {
  value       = azurerm_network_interface_backend_address_pool_association.base[*].id
  description = "The (Terraform specific) ID of the Association between the Network Interface and the Load Balancers Backend Address Pool."
}

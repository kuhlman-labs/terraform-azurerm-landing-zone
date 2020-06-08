###
# resource composition
###

#network interface backend address pool association

resource "azurerm_network_interface_backend_address_pool_association" "base" {
  count = length(var.network_interface_id)

  network_interface_id    = element(var.network_interface_id, count.index)
  ip_configuration_name   = element(var.ip_configuration_name, count.index)
  backend_address_pool_id = var.backend_address_pool_id
}
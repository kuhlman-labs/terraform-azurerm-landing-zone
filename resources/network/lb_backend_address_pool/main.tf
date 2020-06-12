###
# resource composition
###

resource "azurerm_lb_backend_address_pool" "base" {
  resource_group_name = var.resource_group
  loadbalancer_id     = var.loadbalancer_id
  name                = var.name
}
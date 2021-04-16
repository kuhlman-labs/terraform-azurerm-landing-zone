###
# resource composition
###

resource "azurerm_dns_zone" "base" {
  name                = var.domain_name
  resource_group_name = var.resource_group
  tags                = var.tags
}
###
# resource composition
###

resource "azurerm_dns_a_record" "base" {
  name                = var.a_record_name
  resource_group_name = var.resource_group
  zone_name           = var.zone_name
  ttl                 = var.ttl
  records             = var.records
  target_resource_id  = var.target_resource_id
  tags                = var.tags
}
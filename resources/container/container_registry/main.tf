###
# resource composition
###

#random string

resource "random_string" "base" {
  length  = 4
  special = false
}

#container registry

resource "azurerm_container_registry" "base" {
  name                     = lower("${var.name_prefix}${substr(var.environment, 0, 2)}${random_string.base.result}${var.region}")
  resource_group_name      = var.resource_group
  location                 = var.region
  sku                      = var.sku
  admin_enabled            = var.admin_enabled
  georeplication_locations = var.georeplication_locations

  dynamic "network_rule_set" {
    for_each = var.network_rule_set
    content {
      default_action = network_rule_set.value.default_action
      ip_rule {
        action   = network_rule_set.value.ip_rule_action
        ip_range = network_rule_set.value.ip_rule_ip_range
      }
      virtual_network {
        action    = network_rule_set.value.virtual_network_action
        subnet_id = network_rule_set.value.subnet_id
      }
    }
  }
}
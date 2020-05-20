###
# resource composition
###

data "azurerm_client_config" "current" {
}

#random string

resource "random_string" "base" {
  length  = 4
  special = false
}

#key vault

resource "azurerm_key_vault" "base" {
  name                            = lower("${var.name_prefix}${substr(var.environment, 0, 2)}${random_string.base.result}${var.region}")
  location                        = var.region
  resource_group_name             = var.resource_group
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  sku_name                        = var.sku_name
  dynamic "network_acls" {
    for_each = var.network_acls
    content {
      bypass                     = network_acls.value.bypass
      default_action             = network_acls.value.default_action
      ip_rules                   = network_acls.value.ip_rules
      virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
    }
  }
  purge_protection_enabled = var.purge_protection_enabled
  soft_delete_enabled      = var.soft_delete_enabled


  tags = var.tags
}


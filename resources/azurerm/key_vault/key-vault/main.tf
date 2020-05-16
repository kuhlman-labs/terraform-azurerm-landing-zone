###
# resource composition
###

data "azurerm_client_config" "current" {
}

#random

resource "random_string" "base" {
  length  = 5
  special = false
}

#key vault

resource "azurerm_key_vault" "base" {
  name                = "${var.name_prefix}-${random_string.base.result}"
  location            = var.region
  resource_group_name = var.resource_group
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.sku_name
  dynamic "access_policy" {
    for_each = var.access_policy
    content {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = data.azurerm_client_config.current.object_id
      certificate_permissions = access_policy.value.certificate_permissions
      key_permissions         = access_policy.value.key_permissions
      secret_permissions      = access_policy.value.secret_permissions
    }
  }

  /*
  access_policy {
    tenant_id               = data.azurerm_client_config.current.tenant_id
    object_id               = data.azurerm_client_config.current.service_principal_object_id
    certificate_permissions = var.certificate_permissions
    key_permissions         = var.key_permissions
    secret_permissions      = var.secret_permissions
  }
*/
  tags = var.tags
}


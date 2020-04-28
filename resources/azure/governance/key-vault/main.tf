###
# resource composition
###

#data source to access the configuration of the AzureRM provider

data "azurerm_client_config" "current" {
}

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#random permutation of alphanumeric characters

resource "random_string" "base" {
  length  = 8
  special = false
}

#key vault

resource "azurerm_key_vault" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}-${random_string.base.result}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
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


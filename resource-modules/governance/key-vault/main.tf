###############################################
#Setting up Random String generator for KV name
###############################################

resource "random_string" "kv" {
  length  = 8
  special = false
}

data "azurerm_client_config" "current" {
}

###########################
# Setting up Resource Group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

######################
# Setting up Key Vault
######################

resource "azurerm_key_vault" "base" {
  name                = "${var.resource_prefix}-${random_string.kv.result}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku {
    name = var.sku
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.service_principal_object_id

    certificate_permissions = [
      "create",
      "delete",
      "deleteissuers",
      "get",
      "getissuers",
      "import",
      "list",
      "listissuers",
      "managecontacts",
      "manageissuers",
      "setissuers",
      "update",
    ]

    key_permissions = [
      "backup",
      "create",
      "decrypt",
      "delete",
      "encrypt",
      "get",
      "import",
      "list",
      "purge",
      "recover",
      "restore",
      "sign",
      "unwrapKey",
      "update",
      "verify",
      "wrapKey",
    ]

    secret_permissions = [
      "backup",
      "delete",
      "get",
      "list",
      "purge",
      "recover",
      "restore",
      "set",
    ]
  }

  tags = var.tags
}


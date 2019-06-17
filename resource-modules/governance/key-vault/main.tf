###########################
#Setting up Locals for Tags
###########################

locals {
  mandatory_tags = {
    Name          = "KV-${upper(random_string.kv.result)}"
    Owner         = var.owner_tag
    region        = var.region_tag
    Cost-Center   = var.cost_center_tag
    Approver      = var.approver_tag
    Service-Hours = var.service_hours_tag

  }
}

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

data "azurerm_resource_group" "key_vault" {
  name = var.resource_group
}

######################
# Setting up Key Vault
######################

resource "azurerm_key_vault" "main" {
  name                = "KV-${upper(random_string.kv.result)}"
  location            = data.azurerm_resource_group.key_vault.location
  resource_group_name = data.azurerm_resource_group.key_vault.name
  tenant_id           = var.tenant_id

  sku {
    name = var.sku
  }

  access_policy {
    tenant_id = var.tenant_id
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

  tags = merge(local.mandatory_tags, var.optional_tags)
}


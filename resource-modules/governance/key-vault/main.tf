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

resource "random_string" "base" {
  length  = 10
  special = false
}

resource "azurerm_key_vault" "base" {
  name                = "${var.resource_prefix}-${random_string.base.result}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku {
    name = var.sku
  }

  access_policy {
    tenant_id               = data.azurerm_client_config.current.tenant_id
    object_id               = data.azurerm_client_config.current.service_principal_object_id
    certificate_permissions = var.certificate_permissions
    key_permissions         = var.key_permissions
    secret_permissions      = var.secret_permissions
  }

  tags = var.tags
}


resource "azurerm_resource_group" "terraform_state" {
  name     = "tfstate-backend"
  location = var.region
}

resource "random_string" "base" {
  length  = 12
  special = false
}

resource "azurerm_storage_account" "terraform_state_storage_account" {
  name                     = "tfstate${random_string.base.result}"
  resource_group_name      = azurerm_resource_group.terraform_state.name
  location                 = azurerm_resource_group.terraform_state.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "terraform_state_container" {
  name                  = "tfstate"
  resource_group_name   = azurerm_resource_group.terraform_state.name
  storage_account_name  = azurerm_storage_account.terraform_state_storage_account.name
  container_access_type = "private"
}


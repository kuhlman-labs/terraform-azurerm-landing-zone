resource "azurerm_resource_group" "terraform_state" {
  name = "${upper(var.environment)}-TFSTATE"

  location = "${var.region}"
}

resource "azurerm_storage_account" "terraform_state_storage_account" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${azurerm_resource_group.terraform_state.name}"
  location                 = "${var.region}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "terraform-state-container" {
  name                  = "tfstate"
  resource_group_name   = "${azurerm_resource_group.terraform_state.name}"
  storage_account_name  = "${azurerm_storage_account.terraform_state_storage_account.name}"
  container_access_type = "private"
}

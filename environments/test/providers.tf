###
# environment providers
###

terraform {
  required_version = ">= 0.12"
  /*backend "azurerm" {
    container_name       = "tfstate"
    storage_account_name = "tfstatekuhlmanlabs"
    key                  = "test.tfstate"
  }*/
}

provider "azurerm" {
  // version         = "~> 2.0.0"
  features {}
  subscription_id = var.subscription_id
  client_id       = var.app_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}


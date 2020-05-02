###
# environment providers
###

terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "tfstatekuhlmanlabs"
    container_name       = "tfstate"
    key                  = "test.tfstate"
  }
}

provider "azurerm" {
  version = ">= 2.7.0"
  features {}
  subscription_id = var.subscription_id
  client_id       = var.app_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}


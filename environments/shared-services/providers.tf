###
# environment providers
###

terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstate000eus"
    container_name       = "tfstate"
    key                  = "shared-services.tfstate"
  }
}

provider "azurerm" {
  version = ">= 2.0.0"
  features {}
}
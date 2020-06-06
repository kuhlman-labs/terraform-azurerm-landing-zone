###
# environment providers
###

terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformfstate000"
    container_name       = "tfstate"
    key                  = "prod.tfstate"
  }
}

provider "azurerm" {
  version = ">= 2.0.0"
  features {}
}

provider "helm" {
  version = "1.1.1"
}
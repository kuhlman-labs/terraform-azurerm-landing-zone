###
# environment providers
###

terraform {
  required_version = ">= 0.14"
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstate000eus"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
    subscription_id      = "f43de08a-5e35-4ea9-8ca1-11fc231ace6a"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e88ea632-290e-402f-9bbb-a72f1c07208b"
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

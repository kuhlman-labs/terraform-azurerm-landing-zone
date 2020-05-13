###
# environment providers
###

terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformfstate000"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  version = ">= 2.0.0"
  features {}
  subscription_id = var.subscription_id
  client_id       = var.app_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "helm" {
  version = "1.1.1"
}

/*
provider "azurerm" {
  alias   = "shared-services"
  version = "~> 1.32.0"

  # https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html
  subscription_id = var.shared_services_subscription_id
  client_id       = var.app_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

*/
########################################
# Provider
########################################

terraform {
  required_version = ">= 0.12"

  backend "azurerm" {
    storage_account_name = "kuhlmanlabstfstate"
    container_name       = "tfstate"
    key                  = "shared-services.tfstate"
    access_key           = "x3wWSiL9skUf362EgBBgpHETux+mHFd/ZKJAWkIbYuB6x7k7/9b7W/dSydvitYCq24Uh+hrv4JWwB4z4oUYc9g=="
  }
}

provider "azurerm" {

  subscription_id = var.subscription_id
  client_id       = var.app_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}


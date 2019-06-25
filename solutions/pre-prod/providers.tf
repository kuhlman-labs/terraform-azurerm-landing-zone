########################################
# Provider
########################################

terraform {
  required_version = ">= 0.12"

  backend "azurerm" {
    container_name = "tfstate"
    key = "pre-prod.tfstate"
    access_key = "x3wWSiL9skUf362EgBBgpHETux+mHFd/ZKJAWkIbYuB6x7k7/9b7W/dSydvitYCq24Uh+hrv4JWwB4z4oUYc9g=="
    storage_account_name = "kuhlmanlabstfstate"
  }
}

provider "azurerm" {

  # https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html
  subscription_id = var.subscription_id
  client_id       = var.app_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "azurerm" {
  alias = "shared-services"

  # https://www.terraform.io/docs/configuration/providers.html#alias-multiple-provider-instances
  subscription_id = var.shared_services_subscription_id
  client_id       = var.app_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}


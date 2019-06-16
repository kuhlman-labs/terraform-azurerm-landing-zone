########################################
# Provider
########################################

terraform {
  required_version = ">= 0.12"
}

provider "azurerm" {
  version = "=1.29.0"

  # https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html

  subscription_id = var.subscription_id
  client_id       = var.app_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}


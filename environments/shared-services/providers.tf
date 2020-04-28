###
# environment providers
###

terraform {
  required_version = ">= 0.12"
  /*backend "azurerm" {
    container_name = "tfstate"
    key                  = "shared-services.tfstate"
    storage_account_name = "tfstatekuhlmanlabs"
    access_key           = "gRFb0J5kdzT1kA8mC+VoiZvE6qEhHNq7VhfyAS6TYDldZRtzwzmZV1AOquCrt+kZN8+S5j6mKns8yncDC6fyzg=="
  }*/
}

provider "azurerm" {
  //version         = "~> 1.32.0"
  features {}
  subscription_id = var.subscription_id
  client_id       = var.app_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
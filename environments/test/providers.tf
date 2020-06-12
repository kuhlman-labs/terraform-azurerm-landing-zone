###
# environment providers
###

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.14.0"
    }
  }
  required_version = ">= 0.13"
}
########################################
# Variables
########################################
variable "subscription_id" {
  description = "The Id of the Subscription that should contain the created resources"
  type        = "string"
}

variable "app_id" {
  description = "The client ID for the Service Principal"
  type        = "string"
}

variable "client_secret" {
  description = "The secret for the Service Principal authentication"
  type        = "string"
}

variable "tenant_id" {
  description = "The tenant ID for the Service Principal"
  type        = "string"
}

variable "region" {
  description = "The region where the stroage account will be created"
  type        = "string"
}

variable "environment" {
  description = "The environment that the resource group is holding state"
  type        = "string"
}

variable "storage_account_name" {
  description = "The name of the storage account which must be globally unique"
  type        = "string"
}

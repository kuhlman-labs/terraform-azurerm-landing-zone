###
# environment variables
###

#common

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#authentication

variable "subscription_id" {
  description = "The Id of the Subscription that should contain the created resources"
  type        = string
}

variable "shared_services_subscription_id" {
  description = "subscription id of shared-services env"
  type        = string
}

variable "app_id" {
  description = "The client ID for the Service Principal"
  type        = string
}

variable "client_secret" {
  description = "The secret for the Service Principal authentication"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID for the Service Principal"
  type        = string
}

variable "access_key" {
  description = "access key for the storage account that contains the Remote Backend"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account that contains Remote Backend, e.g. terraformdata24321"
  type        = string
}

variable "state_key" {
  description = "Key for the state file of the solution, e.g. pre-prod.tfstate"
  type        = string
}

#network

variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "subnet_frontend_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

variable "subnet_backend_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}

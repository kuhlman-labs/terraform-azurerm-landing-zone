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

variable "client_id" {
  description = "The client ID for the Service Principal"
  type        = string
}

variable "client_secret" {
  description = "The secret for the Service Principal authentication"
  type        = string
}

variable "subscription_id" {
  description = "The Subscription ID in which the Storage Account exists. This can also be sourced from the ARM_SUBSCRIPTION_ID environment variable."
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID in which the Subscription exists. This can also be sourced from the ARM_TENANT_ID environment variable."
  type        = string
}


#network

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list(any)
}

variable "address_prefix_k8s_master" {
  description = "The address prefixe to use for the k8s_master subnet."
  type        = list(string)
}

variable "address_prefix_k8s_node" {
  description = "The address prefixe to use for the k8s_node subnet."
  type        = list(string)
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}


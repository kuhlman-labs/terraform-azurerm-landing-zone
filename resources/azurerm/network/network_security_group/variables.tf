###
# resource variables
###

#common

variable "resource_group" {
  description = "This is the resource group to which the resources will be deployed"
  type        = string
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "nsg"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#nsg

variable "policy_name" {
  description = "policy name or app name"
  type        = string
}


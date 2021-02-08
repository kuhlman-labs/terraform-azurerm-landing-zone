###
# environment variables
###

#common

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}
/*
#authentication

variable "app_id" {
  description = "The client ID for the Service Principal"
  type        = string
}

variable "client_secret" {
  description = "The secret for the Service Principal authentication"
  type        = string
}
*/

variable "object_id" {
  description = "The object ID for the Service Principal"
  type        = string
}

#network

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list(any)
}

variable "address_prefix_agw" {
  description = "The address prefix to use for the vgw subnet."
  type        = list(any)
}

variable "address_prefix_fw" {
  description = "The address prefixe to use for the fw subnet."
  type        = list(any)
}


variable "address_prefix_bastion" {
  description = "The address prefixe to use for the bastion subnet."
  type        = list(any)
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}


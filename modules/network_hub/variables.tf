###
#  module variables
###

#common

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#virtual network

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list(any)
}

variable "dns_servers" {
  description = "(Optional) List of IP addresses of DNS servers"
  type        = list(any)
  default     = null
}

#subnet

variable "address_prefix_fw" {
  description = "The address prefixe to use for the fw subnet."
  type        = list(any)
}

variable "address_prefix_bastion" {
  description = "(Required) The address prefix for the bastion subnet"
  type        = list(any)
}

variable "address_prefix_agw" {
  description = "The subnet address prefix to use for the agw."
  type        = list(string)
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}


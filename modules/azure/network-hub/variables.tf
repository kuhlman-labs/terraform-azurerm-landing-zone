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

#vnet

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

#subnets

variable "address_prefixes" {
  description = "The address prefixes to use for the subnets."
  type        = list(string)
}

variable "vgw_address_prefix" {
  description = "The address prefixes to use for the vgw subnet."
  type        = list
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


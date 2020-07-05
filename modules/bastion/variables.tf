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

#bastion

variable "address_prefix_bastion" {
  description = "(Required) The address prefix for the bastion subnet"
  type        = list
}

variable "virtual_network_name" {
  description = "(Required) The Name of the Virtual Network where this subnet should be located in."
  type        = string
}

variable "virtual_network_resource_group" {
  description = "(Required) The Name of the Virtual Network where this subnet should be located in."
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}

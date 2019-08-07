###
# network-hub module variables
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

variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

#subnets

variable "subnet_dmz_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

#nsg

variable "nsg_rules_dmz" {
  description = "List of NSG rules"
  type        = list
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


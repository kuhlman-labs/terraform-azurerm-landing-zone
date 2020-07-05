###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "bastion"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#bastion_host

#The Subnet used for the Bastion host must have the name AzureBastionSubnet.

variable "virtual_network_name" {
  description = "(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "address_prefix_bastion" {
  description = "(Required) The address prefixes to use for the bastion subnet."
  type        = list
}

variable "public_ip_address_id" {
  description = "(Required) Reference to a Public IP Address to associate with this Bastion Host."
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


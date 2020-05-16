###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "name_prefix" {
  description = "Specifies the name of the Firewall. Changing this forces a new resource to be created."
  type        = string
  default     = "azfw"
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#firewall

variable "virtual_network_name" {
  description = "(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
  type        = string
}

#The Subnet used for the Firewall must have the name AzureFirewallSubnet and the subnet mask must be at least /26.
variable "address_prefixes" {
  description = "(Required) The address prefixes to use for the azfw subnet."
  type        = list
}

variable "public_ip_address_id" {
  description = "(Required) The Resource ID of the Public IP Address associated with the firewall."
  type        = string
}

variable "zones" {
  description = "(Optional) Specifies the availability zones in which the Azure Firewall should be created."
  type        = list
  default     = null
}

#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}
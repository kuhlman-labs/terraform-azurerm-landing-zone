###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "resource_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "vnet"
}

#network

variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "dns_servers" {
  description = "(Optional) List of IP addresses of DNS servers"
  type        = list
  default     = null
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


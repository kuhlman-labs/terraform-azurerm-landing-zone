###
# resource variables
###

#common

variable "resource_group" {
  description = "(Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "nic"
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#network interface

variable "nic_count" {
  description = "Number of nic resources to create"
  type        = number
  default     = 1
}

variable "dns_servers" {
  description = "(Optional) A list of IP Addresses defining the DNS Servers which should be used for this Network Interface."
  type        = list
  default     = null
}

variable "enable_accelerated_networking" {
  description = "(Optional) Should Accelerated Networking be enabled? Defaults to false."
  type        = bool
  default     = null
}

variable "enable_ip_forwarding" {
  description = "(Optional) Should IP Forwarding be enabled? Defaults to false."
  type        = bool
  default     = null
}

variable "internal_dns_name_label" {
  description = "(Optional) The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network."
  type        = string
  default     = null
}

variable "primary" {
  description = "(Optional) Is this the Primary IP Configuration? Must be true for the first ip_configuration when multiple are specified. Defaults to false."
  type        = bool
  default     = null
}

#When private_ip_address_allocation is set to Static the following field can be configured:
variable "private_ip_address" {
  description = "(Optional) The Static IP Address which should be used."
  type        = list
  default     = []
}

variable "private_ip_address_allocation" {
  description = "(Required) The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
  type        = string
}

variable "private_ip_address_version" {
  description = "(Optional) The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4."
  type        = string
  default     = null
}

variable "public_ip_address_id" {
  description = "(Optional) Reference to a Public IP Address to associate with this NIC"
  type        = string
  default     = null
}

#When private_ip_address_version is set to IPv4 the following field can be configured:
variable "subnet_id" {
  description = "(Required) The ID of the Subnet where this Network Interface should be located in."
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}
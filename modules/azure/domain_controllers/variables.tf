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

#windows jumpbox

variable "storage_account_uri" {
  description = "(Required) The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor."
  type        = string
}

variable "virtual_network_name" {
  description = "(Required) The Name of the Virtual Network where this subnet should be located in."
  type        = string
}

variable "virtual_network_resource_group" {
  description = "(Required) The Name of the Virtual Network where this subnet should be located in."
  type        = string
}

variable "private_ip_address_adds" {
  description = "(Required) The Static IP address for the aads Servers"
  type        = list
}

variable "address_prefix_adds" {
  description = "(Required) The address prefix for the aads subnet"
  type        = list
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


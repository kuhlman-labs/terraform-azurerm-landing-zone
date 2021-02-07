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

#glusterfs cluster

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

variable "address_prefix_glusterfs" {
  description = "(Required) The address prefix for the adds subnet"
  type        = list(any)
}

variable "vm_size_glusterfs" {
  description = "(Required) The SKU which should be used for this Virtual Machine, such as Standard_F2."
  type        = string
  default     = "Standard_B2s"
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}

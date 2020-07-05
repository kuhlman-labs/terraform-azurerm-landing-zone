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
  default     = ""
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

variable "subnet_id" {
  description = "(Required) Reference to a subnet in which this Bastion Host has been created."
  type        = string
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


###
# environment variables
###

#common

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

#network

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "address_prefix_data" {
  description = "The address prefix to use for the data subnet."
  type        = list(string)
}

variable "address_prefix_app" {
  description = "The address prefix to use for the app subnet."
  type        = list(string)
}

variable "address_prefix_glusterfs" {
  description = "The address prefix to use for the glusterfs subnet."
  type        = list(string)
}


#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}
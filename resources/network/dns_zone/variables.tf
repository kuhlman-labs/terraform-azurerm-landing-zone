###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

#dns

variable "domain_name" {
  description = "(Required) The name of the DNS Zone. Must be a valid domain name."
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}
###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

#a_record

variable "a_record_name" {
  description = "(Required) The name of the DNS A Record."
  type        = string
}

variable "zone_name" {
  description = "(Required) Specifies the DNS Zone where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "ttl" {
  description = "(Required) The Time To Live (TTL) of the DNS record in seconds."
  type        = string
}

#either records OR target_resource_id must be specified, but not both.

variable "records" {
  description = "(Optional) List of IPv4 Addresses. Conflicts with target_resource_id."
  type        = list(any)
  default     = null
}

variable "target_resource_id" {
  description = "(Optional) The Azure resource id of the target object. Conflicts with records"
  type        = string
  default     = null
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}

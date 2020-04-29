###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "resource_prefix" {
  description = "Specifies the name of the Firewall. Changing this forces a new resource to be created."
  type        = string
  default     = "firewall-network-rule-collection"
}

#firewall network rule collection

variable "azure_firewall_name" {
  description = "(Required) Specifies the name of the Firewall in which the Network Rule Collection should be created. Changing this forces a new resource to be created."
  type        = string
}

variable "collection_priority" {
  description = "Specifies the priority of the rule collection. Possible values are between 100 - 65000."
  type        = string
}

variable "collection_action" {
  description = "Specifies the action the rule will apply to matching traffic. Possible values are Allow and Deny."
  type        = string
}

variable "rule" {
  description = ""
  type        = list
  default     = []
}

#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}
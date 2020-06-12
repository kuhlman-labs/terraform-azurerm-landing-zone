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
  default     = "firewall-network-rule-collection"
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#firewall network rule collection

variable "azure_firewall_name" {
  description = "(Required) Specifies the name of the Firewall in which the Network Rule Collection should be created. Changing this forces a new resource to be created."
  type        = string
}

variable "priority" {
  description = "(Required) Specifies the priority of the rule collection. Possible values are between 100 - 65000."
  type        = string
}

variable "action" {
  description = "(Required) Specifies the action the rule will apply to matching traffic. Possible values are Allow and Deny."
  type        = string
}

variable "rule" {
  description = "(Required) One or more rule blocks as defined below."
  type        = list
  default     = []
  /*
  A rule block supports the following:
name - (Required) Specifies the name of the rule.
description - (Optional) Specifies a description for the rule.
source_addresses - (Required) A list of source IP addresses and/or IP ranges.
destination_addresses - (Required) A list of destination IP addresses and/or IP ranges.
destination_ports - (Required) A list of destination ports.
protocols - (Required) A list of protocols. Possible values are Any, ICMP, TCP and UDP.
*/
}

#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}
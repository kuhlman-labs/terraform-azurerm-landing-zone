###############################
# Setting up resource variables
###############################

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

variable "rule_name" {
  description = "Specifies the name of the rule."
  type        = string
}

variable "rule_source_addresses" {
  description = "A list of source IP addresses and/or IP ranges."
  type        = list

}
variable "rule_destination_ports" {
  description = "A list of destination ports."
  type        = list

}
variable "rule_destination_addresses" {
  description = "A list of destination IP addresses and/or IP ranges."
  type        = list
}
variable "rule_protocols" {
  description = "A list of protocols. Possible values are Any, ICMP, TCP and UDP."
  type        = list
}

#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}
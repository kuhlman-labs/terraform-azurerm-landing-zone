###############################
# Setting up Resource Variables
###############################

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "resource_prefix" {
  description = "Specifies the name of the Firewall. Changing this forces a new resource to be created."
  type        = string
  default     = "firewall"
}


variable "firewall_subnet_id" {
  description = "Reference to the subnet associated with the IP Configuration."
  type        = string
}

variable "firewall_collection_priority" {
  description = "Specifies the priority of the rule collection. Possible values are between 100 - 65000."
  type        = string
}

variable "firewall_collection_action" {
  description = "Specifies the action the rule will apply to matching traffic. Possible values are Allow and Deny."
  type        = string
}

variable "firewall_rule_name" {
  description = "Specifies the name of the rule."
  type        = string
}

variable "firewall_rule_source_addresses" {
  description = "A list of source IP addresses and/or IP ranges."
  type        = list

}
variable "firewall_rule_destination_ports" {
  description = "A list of destination ports."
  type        = list

}
variable "firewall_rule_destination_addresses" {
  description = "A list of destination IP addresses and/or IP ranges."
  type        = list
}
variable "firewall_rule_protocols" {
  description = "A list of protocols. Possible values are Any, ICMP, TCP and UDP."
  type        = list
}


#######################################
#Setting up Mandatory Tagging Variables
#######################################

variable "owner_tag" {
  description = "APP/Technical; Email address of App/Product Owner"
  type        = string
}

variable "region_tag" {
  description = "Financial; i.e. Sharepoint Global"
  type        = string
}

variable "cost_center_tag" {
  description = "Financial; Unique - Code provided directly from Finance (BU/Brand)"
  type        = string
}

variable "approver_tag" {
  description = "Financial; Unique - email address"
  type        = string
}

variable "service_hours_tag" {
  description = "Automation/Security; Sort -FullTime\\|Weekdays..."
  type        = string
}

#######################################
#Setting up Optional Tagging Variables
#######################################

variable "optional_tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}
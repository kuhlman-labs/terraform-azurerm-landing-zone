########################################
# Setting up Resource Variables for VNet
########################################

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "tier" {
  description = "The tier of a VNet, e.g HUB, or SPK"
  type        = string
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
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


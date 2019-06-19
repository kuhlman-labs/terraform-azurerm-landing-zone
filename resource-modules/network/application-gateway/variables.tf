###############################
# Setting up Resource Variables
###############################

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "appgw_vnet_name" {
  description = "Name of the Vnet that the appgw is in"
  type        = string
}

variable "appgw_name" {
  description = "The name of the Application Gateway. Changing this forces a new resource to be created."
  type        = string
}

variable "appgw_sku" {
  description = "The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2."
  type        = string

}

variable "appgw_tier" {
  description = "The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2."
  type        = string
}
variable "appgw_subnet_id" {
  description = "The ID of a Subnet."
  type        = string
}


#######################################
#Setting up Mandatory Tagging Variables
#######################################

variable "owner_tag" {
  description = "APP/Technical; Email address of App/Product Owner"
  type        = string
}

variable "name_tag" {
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
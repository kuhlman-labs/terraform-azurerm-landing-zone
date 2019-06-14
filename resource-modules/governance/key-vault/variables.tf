###############################
# Setting up Resource Variables
###############################

variable "resource_group" {
  description = "The name of the target resource group"
  type        = "string"
}

variable "sku" {
  description = "The Name of the sku used for this Key Vault. Possible values are standard and premium."
  type        = "string"
  default     = "standard"
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  type        = "string"
}

variable "object_id" {
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
  type        = "string"
}

#######################################
#Setting up Mandatory Tagging Variables
#######################################

variable "owner_tag" {
  description = "APP/Technical; Email address of App/Product Owner"
  type        = "string"
}

variable "region_tag" {
  description = "Financial; i.e. Sharepoint Global"
  type        = "string"
}

variable "cost_center_tag" {
  description = "Financial; Unique - Code provided directly from Finance (BU/Brand)"
  type        = "string"
}

variable "approver_tag" {
  description = "Financial; Unique - email address"
  type        = "string"
}

variable "service_hours_tag" {
  description = "Automation/Security; Sort -FullTime\\|Weekdays..."
  type        = "string"
}

variable "cloudreach_ops_tag" {
  description = "Automation/Security; Reserved for Cloudreach Ops"
  type        = "string"
}

#######################################
#Setting up Optional Tagging Variables
#######################################

variable "optional_tags" {
  description = "Optional tags to be added to resource"
  type        = "map"
  default     = {}
}

###############################
# Setting up Resource Variables
###############################

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  type        = string
}

variable "object_id" {
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
  type        = string
}

variable "certificate_contents" {
  description = "The base64-encoded certificate contents. Changing this forces a new resource to be created."
  type        = string
}

variable "certificate_password" {
  description = "The password associated with the certificate. Changing this forces a new resource to be created."
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

variable "cloudreach_ops_tag" {
  description = "Automation/Security; Reserved for Cloudreach Ops"
  type        = string
}

#######################################
#Setting up Optional Tagging Variables
#######################################

variable "optional_tags" {
  description = "Optional tags to be added to resource"
  type        = map(string)
  default     = {}
}


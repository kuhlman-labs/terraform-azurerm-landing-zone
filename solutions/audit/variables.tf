########################################
# Authentication Variables
########################################
variable "subscription_id" {
  description = "The Id of the Subscription that should contain the created resources"
  type        = "string"
}

variable "app_id" {
  description = "The client ID for the Service Principal"
  type        = "string"
}

variable "client_secret" {
  description = "The secret for the Service Principal authentication"
  type        = "string"
}

variable "tenant_id" {
  description = "The tenant ID for the Service Principal"
  type        = "string"
}

########################################
# Variables
########################################

variable "environment" {
  description = "Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab"
  type        = "string"
}

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = "string"
}

########################################
# Tagging Variables
########################################

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
  description = "A map of tags to add to all resources"
  type        = "map"
  default     = {}
}

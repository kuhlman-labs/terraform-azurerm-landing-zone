###############################
# Setting up Resource Variables
###############################

variable "resource_prefix" {
  description = "a short pre-defined text to identify resource type"
  type        = string
  default     = "logaw"
}

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab"
  type        = string
}

variable "sku" {
  description = "SKU for Log Analytics Workspace"
  type        = string
  default     = "PerGB2018"
}

variable "retention_period" {
  description = "Time in days to retain logs in the log analytics workspace"
  type        = string
  default     = 30
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


###############################
# Setting up resource variables
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
  description = "Development environment for resource; prod, non-prod, shared-services"
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
#Setting up Optional Tagging Variables
#######################################

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}


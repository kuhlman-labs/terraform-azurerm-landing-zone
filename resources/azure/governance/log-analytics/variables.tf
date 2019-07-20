###############################
# Setting up resource variables
###############################

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "resource_prefix" {
  description = "a short pre-defined text to identify resource type"
  type        = string
  default     = "log-aw"
}

#log analytics

variable "sku" {
  description = "sku for Log Analytics Workspace"
  type        = string
  default     = "PerGB2018"
}

variable "retention_period" {
  description = "Time in days to retain logs in the log analytics workspace"
  type        = string
  default     = 30
}

#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}


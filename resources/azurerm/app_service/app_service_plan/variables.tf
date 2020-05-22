###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "plan"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#app service plan

variable "kind" {
  description = "(Optional) The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "maximum_elastic_worker_count" {
  description = "The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan."
  type        = number
  default     = null
}

variable "app_service_environment_id" {
  description = "(Optional) The ID of the App Service Environment where the App Service Plan should be located. Changing forces a new resource to be created."
  type        = string
  default     = null
}

variable "reserved" {
  description = "(Optional) Is this App Service Plan Reserved. Defaults to false."
  type        = bool
  default     = null
}

variable "per_site_scaling" {
  description = "(Optional) Can Apps assigned to this App Service Plan be scaled independently? If set to false apps assigned to this plan will scale to all instances of the plan. Defaults to false."
  type        = bool
  default     = null
}

variable "sku_tier" {
  description = "(Required) Specifies the plan's pricing tier."
  type        = string
}

variable "sku_size" {
  description = "(Required) Specifies the plan's instance size."
  type        = string
}

variable "sku_capacity" {
  description = "(Optional) Specifies the number of workers associated with this App Service Plan."
  type        = number
  default     = null
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


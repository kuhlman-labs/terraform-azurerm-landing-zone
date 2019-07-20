variable "resource_prefix" {
  description = "A short pre-defined text to identify the resource type"
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


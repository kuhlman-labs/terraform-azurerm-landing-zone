###
#  module variables
###

#common

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#container registry



#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}

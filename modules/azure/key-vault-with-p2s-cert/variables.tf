###
#  key-vault-with-p2s-cert module variables
###


#common

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}


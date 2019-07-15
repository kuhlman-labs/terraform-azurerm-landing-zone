###############################
# Setting up Resource Variables
###############################


#common

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#key vault cert

variable "certificate_contents" {
  description = "The base64-encoded certificate contents. Changing this forces a new resource to be created."
  type        = string
}

variable "certificate_password" {
  description = "The password associated with the certificate. Changing this forces a new resource to be created."
  type        = string
}

#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}


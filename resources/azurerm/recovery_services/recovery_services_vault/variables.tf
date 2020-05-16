###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "name_prefix" {
  description = "Short prefix to identify resource"
  type        = string
  default     = "recovery-services-vault"
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#rsv

variable "sku" {
  description = "SKU for Recovery Services Vault"
  type        = string
  default     = "Standard"
}

#tags

variable "tags" {
  description = "tags to be added to resource"
  type        = map
  default     = {}
}


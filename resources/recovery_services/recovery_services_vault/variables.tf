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
  default     = "rsv"
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#recovery services vault

variable "sku" {
  description = "(Required) Sets the vault's SKU. Possible values include: Standard, RS0."
  type        = string
}

variable "soft_delete_enabled" {
  description = "(Optional) Is soft delete enable for this Vault? Defaults to true."
  type        = bool
  default     = null
}

#tags

variable "tags" {
  description = "tags to be added to resource"
  type        = map(any)
  default     = {}
}


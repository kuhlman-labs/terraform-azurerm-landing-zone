###############################
# Setting up Resource Variables
###############################

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "resource_prefix" {
  description = "Short prefix to identify resource"
  type        = string
  default     = "recovery-services-vault"
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


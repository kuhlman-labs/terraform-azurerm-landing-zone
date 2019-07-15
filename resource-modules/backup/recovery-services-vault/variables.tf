###############################
# Setting up Resource Variables
###############################

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

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


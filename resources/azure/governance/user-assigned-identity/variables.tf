#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

#uai

variable "uai_name" {
  description = "The name of the user assigned identity. Changing this forces a new identity to be created."
  type        = string
}

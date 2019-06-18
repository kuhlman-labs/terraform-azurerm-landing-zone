###############################
# Setting up Resource Variables
###############################

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "uai_name" {
  description = "The name of the user assigned identity. Changing this forces a new identity to be created."
  type        = string
}

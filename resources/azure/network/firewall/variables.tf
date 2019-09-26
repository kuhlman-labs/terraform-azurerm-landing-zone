###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "resource_prefix" {
  description = "Specifies the name of the Firewall. Changing this forces a new resource to be created."
  type        = string
  default     = "firewall"
}

#firewall

variable "subnet_id" {
  description = "Reference to the subnet associated with the IP Configuration."
  type        = string
}

variable "public_ip_address_id" {
  description = "(Optional) The ID of a Public IP Address which the Firewall should use."
  type        = string
}

#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}
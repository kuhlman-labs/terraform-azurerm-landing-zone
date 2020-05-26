###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

#lb backend address pool

variable "name" {
  description = "(Required) Specifies the name of the Backend Address Pool."
  type        = string
}

variable "load_balancer_id" {
  description = "(Required) The ID of the Load Balancer in which to create the Backend Address Pool."
  type        = string
}



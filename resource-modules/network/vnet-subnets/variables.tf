###########################################
# Setting up Resource Variables for Subnets
###########################################
variable "resource_group" {
  description = "Resource Group of vNet"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "subnets" {
  description = "Map of subnets with name, subnet_cidr, and service_endpoints."
  type        = list
}


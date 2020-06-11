###
# resource variables
###

#network interface backend address pool association

variable "network_interface_id" {
  description = "The ID of the Subnet. Changing this forces a new resource to be created."
  type        = list
}

variable "ip_configuration_name" {
  description = "(Required) The Name of the IP Configuration within the Network Interface which should be connected to the Backend Address Pool. Changing this forces a new resource to be created."
  type        = list
}

variable "backend_address_pool_id" {
  description = "(Required) The ID of the Load Balancer Backend Address Pool which this Network Interface which should be connected to. Changing this forces a new resource to be created."
  type        = string
}


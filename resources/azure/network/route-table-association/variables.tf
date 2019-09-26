###
# resource variables
###

#route table association

variable "subnet_id" {
  description = "The ID of the Subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "route_table_id" {
  description = "The ID of the Route Table which should be associated with the Subnet. Changing this forces a new resource to be created."
  type        = string
}


###
# resource variables
###

#nsg-assocation

variable "subnet_id" {
  description = "Subnet the NSG will apply to"
  type        = string
}

variable "network_security_group_id" {
  description = "Subnet names the NSG will apply to. Used for count"
  type        = string
}


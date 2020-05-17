###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "route"
}

#route-table


variable "disable_bgp_route_propagation" {
  description = "(Optional) Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  type        = bool
  default     = null
}

variable "name" {
  description = "(Required) The name of the route."
  type        = string
}

variable "address_prefix" {
  description = "(Required) The destination CIDR to which the route applies, such as 10.1.0.0/16"
  type        = string
}

variable "next_hop_type" {
  description = "(Required) The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None."
  type        = string
}

variable "next_hop_in_ip_address" {
  description = "(Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
  type        = string
  default     = null
}



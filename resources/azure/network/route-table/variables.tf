###############################
# Setting up resource variables
###############################

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "resource_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "route-table"
}

variable "disable_bgp_route_propagation" {
  description = "bool flag which controls propagation of routes learned by BGP on that route table. True means disable."
  type        = bool
}

variable "route_name" {
  description = "The name of the route."
  type        = string
}

variable "route_address_prefix" {
  description = "The destination CIDR to which the route applies, such as 10.1.0.0/16"
  type        = string
}

variable "route_next_hop_type" {
  description = "The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None."
  type        = string
}

variable "route_next_hop_in_ip_address" {
  description = "Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
  type        = string
  default     = ""
}



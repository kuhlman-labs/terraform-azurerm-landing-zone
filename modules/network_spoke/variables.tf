###
#  module variables
###

#common

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#vnet

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list(any)
}

#peering

variable "virtual_network_hub_name" {
  description = "The name of the hub virtual network"
  type        = string
}

variable "virtual_network_hub_resource_group_name" {
  description = "The name of the hub virtual network resource group"
  type        = string
}

variable "virtual_network_hub_id" {
  description = "The id of the hub virtual network"
  type        = string
}

variable "allow_virtual_network_access_hub" {
  description = "(Optional) Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to true."
  type        = bool
  default     = true
}

variable "allow_forwarded_traffic_hub" {
  description = "(Optional) Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false."
  type        = bool
  default     = true
}

variable "allow_gateway_transit_hub" {
  description = "(Required) Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
  type        = bool
}

variable "use_remote_gateways_hub" {
  description = "(Requred) Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false."
  type        = bool
}

variable "allow_virtual_network_access_spoke" {
  description = "(Optional) Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to true."
  type        = bool
  default     = true
}

variable "allow_forwarded_traffic_spoke" {
  description = "(Optional) Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false."
  type        = bool
  default     = true
}

variable "allow_gateway_transit_spoke" {
  description = "(Required) Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
  type        = bool
}

variable "use_remote_gateways_spoke" {
  description = "(Required) Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false."
  type        = bool
}


#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}

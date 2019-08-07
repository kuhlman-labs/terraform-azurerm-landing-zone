###
# resource variables
###

variable "hub_vnet_rg" {
  description = "This is the resource group name for the Hub Vnet"
  type        = string
}

variable "hub_vnet_id" {
  description = "This is the ID for the Hub Vnet"
  type        = string
}

variable "hub_vnet_name" {
  description = "This is the Hub Vnet name"
  type        = string
}

variable "spoke_vnet_rg" {
  description = "Spoke Vnets resource Group to be peered with the Hub Vnet"
  type        = string
}

variable "spoke_vnet_name" {
  description = "Spoke Vnets Name to be peered with the Hub Vnet"
  type        = string
}

variable "spoke_vnet_id" {
  description = "Spoke Vnets ID to be peered with the Hub Vnet"
  type        = string
}

variable "allow_vnet_access" {
  description = "Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to true."
  type        = string
  default     = "true"
}

variable "allow_forwarded_traffic" {
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to true."
  type        = string
  default     = "true"
}

variable "hub_allow_gateway_transit" {
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
  type        = string
}

variable "hub_use_remote_gateways" {
  description = "Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false."
  type        = string
}

variable "spoke_allow_gateway_transit" {
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
  type        = string
}

variable "spoke_use_remote_gateways" {
  description = "Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false."
  type        = string
}


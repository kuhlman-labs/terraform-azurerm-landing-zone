################################
## Setting up resource variables
################################

#common

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account that contains Remote Backend, e.g. terraformdata24321"
  type        = string
}

variable "container_name" {
  description = "Storage account container that contains Remote Backend, e.g. tfstate"
  type        = string
}

variable "shared_state_key" {
  description = "Key for the shared services State file, e.g. shared-services.tfstate"
  type        = string
}

variable "access_key" {
  description = "access key for the storage account that contains the Remote Backend"
  type        = string
}

#vnet

variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "tier" {
  description = "The tier of a VNet, e.g HUB, or SPK"
  type        = string
  default     = "spk"
}

#subnet

variable "subnet_aks_nodes_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

variable "subnet_virtual_node_aci_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

#peering

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

#route table

variable "route_address_prefix" {
  description = "The destination CIDR to which the route applies, such as 10.1.0.0/16"
  type        = string
}











#######################################
#Setting up Optional Tagging Variables
#######################################
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


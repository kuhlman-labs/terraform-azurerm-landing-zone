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

#virtual network

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "address_prefix_vgw" {
  description = "The address prefixe to use for the vgw subnet."
  type        = list
}

variable "address_prefix_fw" {
  description = "The address prefixe to use for the fw subnet."
  type        = list
}

#virtual network gateway

variable "vgw_sku" {
  description = "(Optional) Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments. A PolicyBased gateway only supports the Basic sku. Further, the UltraPerformance sku is only supported by an ExpressRoute gateway."
  type        = string
  default     = "Basic"
}

variable "vgw_type" {
  description = "(Optional) The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. Changing the type forces a new resource to be created."
  type        = string
  default     = "Vpn"
}

variable "vpn_client_protocols" {
  description = "(Optional) List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN."
  type        = list
  default     = ["SSTP"]
}

variable "vpn_address_space" {
  description = "(Required) The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation."
  type        = list
  default     = ["192.168.100.0/24"]
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


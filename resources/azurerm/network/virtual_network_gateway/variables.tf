###
# resource variables
###

#common

variable "resource_group" {
  description = "resource Group that vNet Gateway will deploy into, must be same as the vNet's resource gorup"
  type        = string
}

variable "name_prefix" {
  description = "a short pre-defined text to identify resource type"
  type        = string
  default     = "vnet-gw"
}

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#vnet-gateway

variable "gateway_subnet" {
  description = "The GateWay subnet id that the VPN gateway will use"
  type        = string
  default     = ""
}

variable "certificate_data" {
  description = "Certificate Information generated from Key Vault that the vNet gateway will use for the P2S connections"
  type        = string
  default     = ""
}

variable "ip_allocation" {
  description = "Allocation method for Public IP Address; Can be Static or Dynamic"
  type        = string
  default     = "Dynamic"
}

variable "gateway_type" {
  description = "Virtual Network Gateway Type; Can be VPN or ExpressRoute"
  type        = string
  default     = "VPN"
}

variable "vpn_type" {
  description = "The routing type of the Virtual Network Gateway; Can be RouteBased or PolicyBased."
  type        = string
  default     = "RouteBased"
}

variable "sku" {
  description = "Configuration of the size and capacity of the virtual network gateway; Can be are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw1AZ, VpnGw2AZ, and VpnGw3AZ and depend on the type and vpn_type arguments. A PolicyBased gateway only supports the Basic sku. Further, the UltraPerformance sku is only supported by an ExpressRoute gateway."
  type        = string
  default     = "Basic"
}

variable "client_address_spaces" {
  description = "The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation"
  type        = list
}

variable "vpn_client_protocols" {
  description = "List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN."
  type        = list
}











#######################################
# Optional Tagging variables
#######################################
variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}


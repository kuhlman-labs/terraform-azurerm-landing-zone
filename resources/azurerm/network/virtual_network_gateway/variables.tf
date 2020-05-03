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
  default     = "vgw"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#vnet-gateway

variable "public_ip_name" {
  description = "(Required) Name of the public ip associated with the vgw"
  type        = string
}

variable "subnet_id" {
  description = "(Required) The ID of the gateway subnet of a virtual network in which the virtual network gateway will be created. It is mandatory that the associated subnet is named GatewaySubnet. Therefore, each virtual network can contain at most a single Virtual Network Gateway."
  type        = string
}

variable "public_cert_data" {
  description = "(Required) The public certificate of the root certificate authority. The certificate must be provided in Base-64 encoded X.509 format (PEM). In particular, this argument must not include the -----BEGIN CERTIFICATE----- or -----END CERTIFICATE----- markers."
  type        = string
}

variable "type" {
  description = "(Required) The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. Changing the type forces a new resource to be created."
  type        = string
}

variable "vpn_type" {
  description = "(Optional) The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased."
  type        = string
  default     = null
}

variable "sku" {
  description = "(Required) Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments. A PolicyBased gateway only supports the Basic sku. Further, the UltraPerformance sku is only supported by an ExpressRoute gateway."
  type        = string
}

variable "generation" {
  description = "(Optional) The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None."
  type        = string
  default     = null
}

variable "active_active" {
  description = "(Optional) If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false."
  type        = bool
  default     = null
}

variable "enable_bgp" {
  description = "(Optional) If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false."
  type        = bool
  default     = null
}

variable "default_local_network_gateway_id" {
  description = "(Optional) The ID of the local network gateway through which outbound Internet traffic from the virtual network in which the gateway is created will be routed (forced tunnelling). Refer to the Azure documentation on forced tunnelling. If not specified, forced tunnelling is disabled."
  type        = string
  default     = null
}

variable "private_ip_address_allocation" {
  description = "(Optional) Defines how the private IP address of the gateways virtual interface is assigned. Valid options are Static or Dynamic. Defaults to Dynamic."
  type        = string
  default     = null
}

variable "address_space" {
  description = "(Required) The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation."
  type        = list
}

variable "vpn_client_protocols" {
  description = "(Optional) List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN."
  type        = list
  default     = null
}

variable "revoked_certificate" {
  description = "(Optional) One or more revoked_certificate blocks which are defined below. This setting is incompatible with the use of radius_server_address and radius_server_secret."
  type        = list
  default     = null
}

variable "root_certificate_name" {
  description = "(Required) A user-defined name of the root certificate."
  type        = string
}

#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}


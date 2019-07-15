################################
## Setting up resource variables
################################

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

variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

#subnet

variable "subnet_gateway_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

variable "subnet_dmz_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

variable "subnet_firewall_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

variable "subnet_app_gw_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

#nsg

variable "nsg_rules_dmz" {
  description = "List of NSG rules"
  type        = list
}

#vpn

variable "certificate_data" {
  description = "Certificate Information generated from Key Vault that the vNet gateway will use for the P2S connections"
  type        = string
  default     = ""
}

variable "client_address_spaces" {
  description = "The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation"
  type        = list
}

variable "vpn_client_protocols" {
  description = "List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN."
  type        = list
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


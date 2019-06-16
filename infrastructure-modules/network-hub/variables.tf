########################################
## Setting up Network Resource Variables
########################################
variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "tier" {
  description = "The tier of a VNet, e.g HUB, or SPK"
  type        = string
  default     = "hub"
}

variable "subnets_hub" {
  description = "Map of subnets with name, subnet_cidr, and service_endpoints."
  type        = list
}

variable "nsg_rules_dmz" {
  description = "List of NSG rules"
  type        = list
}

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

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab"
  type        = string
}

#######################################
#Setting up Mandatory Tagging Variables
#######################################

variable "owner_tag" {
  description = "APP/Technical; Email address of App/Product Owner"
  type        = string
}

variable "region_tag" {
  description = "Financial; i.e. Sharepoint Global"
  type        = string
}

variable "cost_center_tag" {
  description = "Financial; Unique - Code provided directly from Finance (BU/Brand)"
  type        = string
}

variable "approver_tag" {
  description = "Financial; Unique - email address"
  type        = string
}

variable "service_hours_tag" {
  description = "Automation/Security; Sort -FullTime\\|Weekdays..."
  type        = string
}

variable "cloudreach_ops_tag" {
  description = "Automation/Security; Reserved for Cloudreach Ops"
  type        = string
}

#######################################
#Setting up Optional Tagging Variables
#######################################
variable "optional_tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


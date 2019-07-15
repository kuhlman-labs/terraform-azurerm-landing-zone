###########################
# Shared Services Variables
###########################

#common

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "subscription_id" {
  description = "The Id of the Subscription that should contain the created resources"
  type        = string
}

variable "app_id" {
  description = "The client ID for the Service Principal"
  type        = string
}

variable "client_secret" {
  description = "The secret for the Service Principal authentication"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID for the Service Principal"
  type        = string
}

variable "shared_services_subscription_id" {
  description = "subscription id of shared-services env"
  type        = string
}

variable "state_key" {
  description = "Key for the state file of the solution, e.g. pre-prod.tfstate"
  type        = string
}

variable "access_key" {
  description = "access key for the storage account that contains the Remote Backend"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account that contains Remote Backend, e.g. terraformdata24321"
  type        = string
}

#network

variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

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
  description = "List of NSG rules for DMZ subnet"
  type        = list
}

#vpn

variable "client_address_spaces" {
  description = "The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation"
  type        = list
}

variable "vpn_client_protocols" {
  description = "List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN."
  type        = list
}

#aks

variable "aks_client_id" {
  description = "The Client ID of an Azure Active Directory Application. Changing this forces a new resource to be created."
  type        = string
}

variable "aks_server_id" {
  description = "The Server ID of an Azure Active Directory Application. Changing this forces a new resource to be created."
  type        = string
}

variable "aks_server_object_id" {
  description = "The Object ID of the AKS Server to assign the Role Definition to. Changing this forces a new resource to be created."
  type        = string
}

variable "aks_server_client_secret" {
  description = "The Server Secret of an Azure Active Directory Application. Changing this forces a new resource to be created."
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


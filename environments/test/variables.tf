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

#authentication

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

variable "hub_vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "spoke_vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "subnet_frontend_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

variable "subnet_backend_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

variable "subnet_dmz_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

variable "subnet_aks_nodes_address_prefix" {
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

#aks

variable "dns_service_ip" {
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
  type        = string
}

variable "docker_bridge_cidr" {
  description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
  type        = string
}

variable "service_cidr" {
  description = "The Network Range used by the Kubernetes service. This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


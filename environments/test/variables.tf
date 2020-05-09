###
# environment variables
###

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

variable "object_id" {
  description = "The object ID for the Service Principal"
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

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "address_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}

variable "address_prefix_vgw" {
  description = "The address prefix to use for the vgw subnet."
  type        = list
}

variable "spoke_address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "address_prefixes_spoke" {
  description = "The address prefixes to use for the subnets."
  type        = list(string)
}

variable "subnet_name_prefixes" {
  description = "The name of the subnets. Changing this forces a new resource to be created."
  type        = list(string)
}

variable "spoke_subnet_name_prefixes" {
  description = "The name of the subnets. Changing this forces a new resource to be created."
  type        = list(string)
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
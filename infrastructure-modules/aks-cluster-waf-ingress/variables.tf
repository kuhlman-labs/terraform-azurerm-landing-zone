##############################################
# Setting up aks-cluster-waf-ingress variables
##############################################

#common

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#authentication

variable "client_secret" {
  description = "The Client Secret for the Service Principal. Changing this forces a new resource to be created."
  type        = string
}

#network

variable "vnet_name" {
  description = "The name of the Vnet."
  type        = string
}

variable "vnet_rg" {
  description = "The Resource Group of the Vnet"
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

#aks

variable "admin_user_name" {
  description = "The Admin Username for the Cluster. Changing this forces a new resource to be created."
  type        = string
}

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
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}
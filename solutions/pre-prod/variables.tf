####################
# Pre-Prod Variables
####################
variable "subscription_id" {
  description = "The Id of the Subscription that should contain the created resources"
  type        = string
}

variable "shared_services_subscription_id" {
  description = "subscription id of shared-services env"
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

variable "access_key" {
  description = "access key for the storage account that contains the Remote Backend"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account that contains Remote Backend, e.g. terraformdata24321"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "state_key" {
  description = "Key for the state file of the solution, e.g. pre-prod.tfstate"
  type        = string
}

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "subnets_spoke" {
  description = "Map of subnets with name, subnet_cidr, and service_endpoints."
  type        = list
}

variable "nsg_rules" {
  description = "List of NSG rules"
  type        = list
  default     = []
}

variable "admin_user_name" {
  description = "The Admin Username for the Cluster. Changing this forces a new resource to be created."
  type        = string
}

variable "aks_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  type        = string
}

#variable "api_server_authorized_ip_ranges" {
#  description = "The IP ranges to whitelist for incoming traffic to the masters"
#  type        = list
#}

variable "aks_agent_count" {
  description = "Number of Agents (VMs) in the Pool. Possible values must be in the range of 1 to 100 (inclusive). Defaults to 1."
  type        = string
}

variable "aks_agent_vm_size" {
  description = "The size of each VM in the Agent Pool (e.g. Standard_F1). Changing this forces a new resource to be created."
  type        = string
}

variable "aks_dns_service_ip" {
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
  type        = string
}

variable "aks_docker_bridge_cidr" {
  description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
  type        = string
}

variable "aks_service_cidr" {
  description = "The Network Range used by the Kubernetes service. This is required when network_plugin is set to azure. Changing this forces a new resource to be created."
  type        = string
}

variable "aks_agent_type" {
  description = "Type of the Agent Pool. Possible values are AvailabilitySet and VirtualMachineScaleSets. Changing this forces a new resource to be created. Defaults to AvailabilitySet."
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



#######################################
#Setting up Optional Tagging Variables
#######################################
variable "optional_tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}


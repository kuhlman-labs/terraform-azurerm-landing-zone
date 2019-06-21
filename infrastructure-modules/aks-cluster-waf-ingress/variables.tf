###############################################
## Setting up aks-cluster-waf-ingress Variables
###############################################

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "client_id" {
  description = " The Client ID for the Service Principal. Changing this forces a new resource to be created"
  type        = string
}

variable "client_secret" {
  description = "The Client Secret for the Service Principal. Changing this forces a new resource to be created."
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used. Changing this forces a new resource to be created."
  type        = string
}

variable "appgw_vnet_name" {
  description = "Name of the Vnet that the appgw is in"
  type        = string
}

variable "appgw_subnet_id" {
  description = "The ID of a Subnet."
  type        = string
}

variable "aks_subnet_id" {
  description = "The ID of the Subnet where the Agents in the Pool should be provisioned. Changing this forces a new resource to be created."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace which the OMS Agent should send data to."
  type        = string
}

variable "admin_user_name" {
  description = "The Admin Username for the Cluster. Changing this forces a new resource to be created."
  type        = string
}

variable "aks_aci_subnet_name" {
  description = "The subnet name for the virtual nodes to run."
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
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}
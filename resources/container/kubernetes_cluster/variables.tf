###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "name_prefix" {
  description = "Short prefix to identify resource"
  type        = string
  default     = "aks"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#kubernetes_cluster

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  type        = string
  default     = null
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
  type        = string
  default     = "nodes"
}

variable "private_cluster_enabled" {
  description = "Should this Kubernetes Cluster have it's API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "api_server_authorized_ip_ranges" {
  description = "(Optional) The IP ranges to whitelist for incoming traffic to the masters."
  type        = list(string)
  default     = null
}

variable "sku_tier" {
  description = "(Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid (which includes the Uptime SLA). Defaults to Free."
  type        = string
  default     = null
}

#default_node_pool

variable "node_pool_name" {
  description = "(Required) The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vm_size" {
  description = "(Required) The size of the Virtual Machine, such as Standard_DS2_v2."
  type        = string
}

variable "availability_zones" {
  description = "(Optional) A list of Availability Zones across which the Node Pool should be spread."
  type        = list(any)
  default     = null
}

variable "enable_auto_scaling" {
  description = "(Optional) Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false."
  type        = bool
  default     = null
}

variable "enable_node_public_ip" {
  description = "(Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false."
  type        = bool
  default     = null
}

variable "max_count" {
  description = "(Required) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100."
  type        = number
  default     = null
}

variable "min_count" {
  description = "(Required) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100."
  type        = number
  default     = null
}

variable "node_count" {
  description = "(Required) The number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100."
  type        = number
  default     = null
}

variable "max_pods" {
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  type        = number
  default     = null
}

variable "node_labels" {
  description = "(Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool."
  type        = map(any)
  default     = null
}

variable "node_taints" {
  description = "(Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g key=value:NoSchedule)."
  type        = list(any)
  default     = null
}

variable "os_disk_size_gb" {
  description = "(Optional) The size of the OS Disk which should be used for each agent in the Node Pool. Changing this forces a new resource to be created."
  type        = number
  default     = null
}

variable "type" {
  description = "(Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets."
  type        = string
  default     = null
}

variable "vnet_subnet_id" {
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

#addon_profile

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace which the OMS Agent should send data to. Must be present if enabled is true."
  type        = string
}

variable "aci_connector_linux_enabled" {
  description = "(Required) Is the virtual node addon enabled?"
  type        = string
}

variable "aci_connector_linux_subnet_name" {
  description = "(Optional) The subnet name for the virtual nodes to run. This is required when aci_connector_linux enabled argument is set to true."
  type        = string
  default     = null
}

#identity

variable "identity_type" {
  description = "The type of identity used for the managed cluster. At this time the only supported value is SystemAssigned"
  type        = string
  default     = "SystemAssigned"
}

#linux_profile

variable "linux_profile_admin_username" {
  description = "(Required) The Admin Username for the Cluster. Changing this forces a new resource to be created."
  type        = string
}

variable "linux_profile_key_data" {
  description = "(Required) An ssh_key block. Only one is currently allowed. Changing this forces a new resource to be created."
  type        = string
}

#network_profile

variable "network_plugin" {
  description = "(Required) Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created."
  type        = string
}

variable "network_policy" {
  description = "(Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "dns_service_ip" {
  description = "(Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "dns_bridge_cidr" {
  description = "(Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "docker_bridge_cidr" {
  description = "(Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "outbound_type" {
  description = "(Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer."
  type        = string
  default     = null
}

variable "pod_cidr" {
  description = "(Optional) The CIDR to use for pod IP addresses. This field can only be set when network_plugin is set to kubenet. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "service_cidr" {
  description = "(Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "outbound_ports_allocated" {
  description = "(Optional) Number of desired SNAT port for each VM in the clusters load balancer. Must be between 0 and 64000 inclusive. Defaults to 0."
  type        = number
  default     = null
}

variable "idle_timeout_in_minutes" {
  description = "(Optional) Desired outbound flow idle timeout in minutes for the cluster load balancer. Must be between 4 and 120 inclusive. Defaults to 30."
  type        = number
  default     = null
}

variable "managed_outbound_ip_count" {
  description = "(Optional) Count of desired managed outbound IPs for the cluster load balancer. Must be between 1 and 100 inclusive."
  type        = number
  default     = null
}

variable "outbound_ip_prefix_ids" {
  description = "(Optional) The ID of the outbound Public IP Address Prefixes which should be used for the cluster load balancer."
  type        = list(string)
  default     = null
}

variable "outbound_ip_address_ids" {
  description = "(Optional) The ID of the Public IP Addresses which should be used for outbound communication for the cluster load balancer."
  type        = list(string)
  default     = null
}

#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map(any)
  default     = {}
}
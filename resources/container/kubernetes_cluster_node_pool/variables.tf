###
# resource variables
###

#kubernetes_cluster_node_pool

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  type        = string
  default     = null
}

variable "node_pool_name" {
  description = "(Required) The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created."
  type        = string
}

variable "kubernetes_cluster_id" {
  description = "(Required) The ID of the Kubernetes Cluster where this Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
}

variable "vm_size" {
  description = "(Required) The SKU which should be used for the Virtual Machines used in this Node Pool. Changing this forces a new resource to be created."
  type        = string
}

variable "availability_zones" {
  description = "(Optional) A list of Availability Zones where the Nodes in this Node Pool should be created in. Changing this forces a new resource to be created."
  type        = list(any)
  default     = null
}

variable "enable_auto_scaling" {
  description = " (Optional) Whether to enable auto-scaler. Defaults to false."
  type        = bool
  default     = null
}

variable "enable_node_public_ip" {
  description = "(Optional) Should each node have a Public IP Address? Defaults to false."
  type        = bool
  default     = null
}

variable "max_pods" {
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  type        = number
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

variable "priority" {
  description = "(Optional) The Priority for Virtual Machines within the Virtual Machine Scale Set that powers this Node Pool. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "spot_max_price" {
  description = "(Optional) The maximum price you're willing to pay in USD per Virtual Machine. Valid values are -1 (the current on-demand price for a Virtual Machine) or a positive value with up to five decimal places. Changing this forces a new resource to be created."
  type        = number
  default     = null
}

variable "eviction_policy" {
  description = "(Optional) The Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool. Possible values are Deallocate and Delete. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "mode" {
  description = "(Optional) Should this Node Pool be used for System or User resources? Possible values are System and User. Defaults to User."
  type        = string
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

variable "os_disk_type" {
  description = "(Optional) The type of disk which should be used for the Operating System. Possible values are Ephemeral and Managed. Defaults to Managed. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "os_type" {
  description = "(Optional) The Operating System which should be used for this Node Pool. Changing this forces a new resource to be created. Possible values are Linux and Windows. Defaults to Linux."
  type        = string
  default     = null
}

variable "proximity_placement_group_id" {
  description = "(Optional) The ID of the Proximity Placement Group where the Virtual Machine Scale Set that powers this Node Pool will be placed. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "vnet_subnet_id" {
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map(any)
  default     = {}
}
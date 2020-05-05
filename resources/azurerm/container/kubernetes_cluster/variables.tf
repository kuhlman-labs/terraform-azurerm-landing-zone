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

#aks

variable "name" {
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
  type        = list
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


variable "node_labels" {
  description = "(Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool."
  type        = map
  default     = null
}

variable "node_taints" {
  description = "(Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g key=value:NoSchedule)."
  type        = list
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

variable "node_resource_group" {
  description = "(Optional) The name of the resource Group where the the Kubernetes Nodes should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "api_server_authorized_ip_ranges" {
  description = "(Optional) The IP ranges to whitelist for incoming traffic to the masters."
  type        = list
  default     = null
}

variable "enable_pod_security_policy" {
  description = "(Optional) Whether Pod Security Policies are enabled. Note that this also requires role based access control to be enabled."
  type        = bool
  default     = null
}

variable "private_cluster_enabled" {
  description = "Should this Kubernetes Cluster have it's API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "linux_profile" {
  description = "https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#linux_profile"
  type        = list
  default     = []
  /*
  [
    {
      admin_username = "admin"
      key_data = "${path.module}/id_rsa.pub"
    }
  ]
  */
}

variable "windows_profile" {
  description = "https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#windows_profile"
  type        = list
  default     = []
  /*
  [
    {
      admin_username = "admin"
      admin_password = "password"
    }
  ]
  */
}


variable "network_profile" {
  description = "https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#network_profile"
  type        = list
  default     = []
  /*
  #NOTE: When network_plugin is set to azure - the vnet_subnet_id field in the agent_pool_profile block must be set.
  [
    {
      network_plugin = "kubenet"
      #This field can only be set when network_plugin is set to azure
      network_policy = null
      #This is required when network_plugin is set to azure
      dns_service_ip = null
      #This is required when network_plugin is set to azure
      docker_bridge_cidr = null
      #This field can only be set when network_plugin is set to kubenet.
      pod_cidr = "172.16.0.0/16"
      #This is required when network_plugin is set to azure.
      service_cidr = null
      load_balancer_sku = "Basic"
    }
  ]
  */
}

variable "role_based_access_control" {
  description = "https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#role_based_access_control"
  type        = list
  default     = []
  /*
  [
    {
      enabled = "true"
      client_app_id     = "client_app_id"
      server_app_id     = "server_app_id"
      server_app_secret = "server_app_secret"
      tenant_id         = "tenant_id"
    }
  ]
  */
}

variable "addon_profile" {
  description = "https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#addon_profile"
  type        = list
  default     = []
  /*
  [
    {
      http_appication_routing_enabled = "false"
      oms_agent_enabled               = "false"
      log_analytics_workspace_id = null
      aci_connector_linux_enabled = "false"
      aci_connector_linux_name_prefix = null
    }
  ]
  */
}


#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}



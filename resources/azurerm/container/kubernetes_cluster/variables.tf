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
  default     = "aks-cluster"
}

#authentication

variable "client_id" {
  description = " The Client ID for the Service Principal. Changing this forces a new resource to be created"
  type        = string
}

variable "client_secret" {
  description = "The Client Secret for the Service Principal. Changing this forces a new resource to be created."
  type        = string
}

#aks

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  type        = string
  default     = null
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
  type        = string
  default     = "agents"
}

variable "api_server_authorized_ip_ranges" {
  description = "The IP ranges to whitelist for incoming traffic to the masters"
  type        = list
  default     = null
}

variable "node_resource_group" {
  description = "(Optional) The name of the resource Group where the the Kubernetes Nodes should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}


variable "agent_pool_profile" {
  description = "https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#agent_pool_profile"
  type        = list
  default = [
    #NOTE: When network_plugin is set to azure - the vnet_subnet_id field in the agent_pool_profile block must be set.  
    {
      name               = "default"
      count              = "1"
      vm_size            = "Standard_B2s"
      availability_zones = null
      enable_autoscaling = "true"
      min_count          = "1"
      max_count          = "3"
      maxpods            = null
      os_disk_size_gb    = "30"
      os_type            = "Linux"
      type               = "VirtualMachineScaleSets"
      vnet_subnet_id     = null
      node_taints        = null
    }
  ]
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



###
#  resource composition
###

#kubernetes_cluster

resource "azurerm_kubernetes_cluster" "base" {
  name                            = "${var.name_prefix}-${var.environment}-${var.region}"
  location                        = var.region
  resource_group_name             = var.resource_group
  node_resource_group             = "${var.resource_group}-nodes"
  kubernetes_version              = var.kubernetes_version
  dns_prefix                      = var.dns_prefix
  private_cluster_enabled         = var.private_cluster_enabled
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  sku_tier                        = var.sku_tier

  default_node_pool {
    name                  = var.node_pool_name
    vm_size               = var.vm_size
    orchestrator_version  = var.kubernetes_version
    availability_zones    = var.availability_zones
    enable_auto_scaling   = var.enable_auto_scaling
    enable_node_public_ip = var.enable_node_public_ip
    max_count             = var.max_count
    min_count             = var.min_count
    node_count            = var.node_count
    max_pods              = var.max_pods
    node_labels           = var.node_labels
    node_taints           = var.node_taints
    os_disk_size_gb       = var.os_disk_size_gb
    type                  = var.type
    vnet_subnet_id        = var.vnet_subnet_id
    tags                  = var.tags
  }

  addon_profile {
    http_application_routing {
      enabled = false
    }
    azure_policy {
      enabled = true
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
    aci_connector_linux {
      enabled     = var.aci_connector_linux_enabled
      subnet_name = var.aci_connector_linux_subnet_name
    }
    kube_dashboard {
      enabled = false
    }
  }

  identity {
    type = var.identity_type
  }

  linux_profile {
    admin_username = var.linux_profile_admin_username
    ssh_key {
      key_data = var.linux_profile_key_data
    }
  }

  network_profile {
    network_plugin     = var.network_plugin
    network_policy     = var.network_policy
    dns_service_ip     = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr
    outbound_type      = var.outbound_type
    pod_cidr           = var.pod_cidr
    service_cidr       = var.service_cidr
    load_balancer_sku  = "Standard"
    load_balancer_profile {
      outbound_ports_allocated  = var.outbound_ports_allocated
      idle_timeout_in_minutes   = var.idle_timeout_in_minutes
      managed_outbound_ip_count = var.managed_outbound_ip_count
      outbound_ip_prefix_ids    = var.outbound_ip_prefix_ids
      outbound_ip_address_ids   = var.outbound_ip_address_ids
    }
  }

  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed = true
    }
  }

  tags = var.tags
}

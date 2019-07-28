###########################
# Setting up resource group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

################
# Setting up AKS
################

resource "azurerm_kubernetes_cluster" "base" {
  name                            = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}"
  location                        = data.azurerm_resource_group.base.location
  dns_prefix                      = var.dns_prefix
  resource_group_name             = data.azurerm_resource_group.base.name
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  kubernetes_version              = var.kubernetes_version
  node_resource_group             = var.node_resource_group

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  dynamic "agent_pool_profile" {
    for_each = var.agent_pool_profile
    content {
      name                = agent_pool_profile.value.name
      count               = agent_pool_profile.value.count
      vm_size             = agent_pool_profile.value.vm_size
      availability_zones  = agent_pool_profile.value.availability_zones
      enable_auto_scaling = agent_pool_profile.value.enable_auto_scaling
      min_count           = agent_pool_profile.value.min_count
      max_count           = agent_pool_profile.value.max_count
      max_pods            = agent_pool_profile.value.max_pods
      os_disk_size_gb     = agent_pool_profile.value.os_disk_size_gb
      os_type             = agent_pool_profile.value.os_type
      type                = agent_pool_profile.value.type
      vnet_subnet_id      = agent_pool_profile.value.vnet_subnet_id
      node_taints         = agent_pool_profile.value.node_taints
    }
  }

  dynamic "linux_profile" {
    for_each = var.linux_profile
    content {
      admin_username = linux_profile.value.admin_username
      ssh_key {
        key_data = linux_profile.value.key_data
      }
    }
  }

  dynamic "windows_profile" {
    for_each = var.windows_profile
    content {
      admin_username = windows_profile.value.admin_username
      admin_password = windows_profile.value.admin_password
    }
  }

  dynamic "network_profile" {
    for_each = var.network_profile
    content {
      network_plugin     = network_profile.value.network_plugin
      dns_service_ip     = network_profile.value.dns_service_ip
      docker_bridge_cidr = network_profile.value.docker_bridge_cidr
      pod_cidr           = network_profile.value.pod_cidr
      service_cidr       = network_profile.value.service_cidr
      load_balancer_sku  = network_profile.value.load_balancer_sku
    }
  }

  dynamic "addon_profile" {
    for_each = var.addon_profile
    content {
      http_application_routing {
        enabled = addon_profile.value.http_appication_routing_enabled
      }
      oms_agent {
        enabled                    = addon_profile.value.oms_agent_enabled
        log_analytics_workspace_id = addon_profile.value.log_analytics_workspace_id
      }
      aci_connector_linux {
        enabled     = addon_profile.value.aci_connector_linux_enabled
        subnet_name = addon_profile.value.aci_connector_linux_subnet_name
      }
    }
  }

  dynamic "role_based_access_control" {
    for_each = var.role_based_access_control
    content {
      enabled = role_based_access_control.value.enabled
      azure_active_directory {
        client_app_id     = role_based_access_control.value.client_app_id
        server_app_id     = role_based_access_control.value.server_app_id
        server_app_secret = role_based_access_control.value.server_app_secret
        tenant_id         = role_based_access_control.value.tenant_id
      }
    }
  }

  tags = var.tags
}


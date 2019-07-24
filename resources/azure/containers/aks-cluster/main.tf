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

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  dynamic "agent_pool_profile" {
    for_each = var.agent_pool_profile
    content {
      name            = agent_pool_profile.value.name
      count           = agent_pool_profile.value.count
      vm_size         = agent_pool_profile.value.vm_size
      max_pods        = agent_pool_profile.value.max_pods
      os_disk_size_gb = agent_pool_profile.value.os_disk_size_gb
      os_type         = agent_pool_profile.value.os_type
      type            = agent_pool_profile.value.type
      vnet_subnet_id  = agent_pool_profile.value.vnet_subnet_id
    }
  }

  dynamic "linux_profile" {
    for_each = var.linux_profile
    content {
      admin_username = linux_profile.value.admin_user_name
      ssh_key {
        key_data = linux_profile.value.key_data
      }
    }
  }

  dynamic "network_profile" {
    for_each = var.network_profile
    content {
      network_plugin     = network_profile.value.network_plugin
      network_policy     = network_profile.value.network_policy
      dns_service_ip     = network_profile.value.dns_service_ip
      docker_bridge_cidr = network_profile.value.docker_bridge_cidr
      pod_cidr           = network_profile.value.pod_cidr
      service_cidr       = network_profile.value.service_cidr
    }
  }
  addon_profile {
    dynamic "http_application_routing" {
      for_each = var.http_application_routing
      content {
        enabled = http_application_routing.value.enabled
      }
    }
    dynamic "oms_agent" {
      for_each = var.oms_agent
      content {
        enabled                    = oms_agent.value.enabled
        log_analytics_workspace_id = oms_agent.value.workspace_id
      }
    }
    dynamic "aci_connector_linux" {
      for_each = var.aci_connector_linux
      content {
        enabled     = aci_connector_linux.value.enabled
        subnet_name = aci_connector_linux.value.subnet_name
      }
    }
  }

  dynamic "role_based_access_control" {
    for_each = var.role_based_access_control
    content {
      azure_active_directory {
        client_app_id     = role_based_access_control.value.client_app_id
        server_app_id     = role_based_access_control.value.server_app_id
        server_app_secret = role_based_access_control.value.server_app_secret
        tenant_id         = role_based_access_control.value.tenant_id
      }
      enabled = role_based_access_control.value.enabled
    }
  }

  tags = var.tags
}


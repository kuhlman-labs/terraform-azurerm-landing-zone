###
#  resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#aks

resource "azurerm_kubernetes_cluster" "base" {
  name                = "${var.name_prefix}-${var.environment}-${data.azurerm_resource_group.base.location}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name

  default_node_pool {
    name                  = var.name
    vm_size               = var.vm_size
    availability_zones    = var.availability_zones
    enable_auto_scaling   = var.enable_auto_scaling
    max_count             = var.max_count
    min_count             = var.min_count
    node_count            = var.node_count
    enable_node_public_ip = var.enable_node_public_ip
    max_pods              = var.max_pods
    node_labels           = var.node_labels
    node_taints           = var.node_taints
    os_disk_size_gb       = var.os_disk_size_gb
    type                  = var.type
    tags                  = var.tags
    vnet_subnet_id        = var.vnet_subnet_id
  }

  dns_prefix = var.dns_prefix

  dynamic "addon_profile" {
    for_each = var.addon_profile
    content {
      http_application_routing {
        enabled = addon_profile.value.http_appication_routing_enabled
      }
      azure_policy {
        enabled = addon_profile.value.azure_policy_enabled
      }
      kube_dashboard {
        enabled = addon_profile.value.kube_dashboard_enabled
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

  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  enable_pod_security_policy      = var.enable_pod_security_policy

  dynamic "identity" {
    for_each = var.identity
    content {
      type = identity.value.type
    }
  }

  dynamic "service_principal" {
    for_each = var.service_principal
    content {
      client_id     = service_principal.value.client_id
      client_secret = service_principal.value.client_secret
    }
  }

  kubernetes_version = var.kubernetes_version

  dynamic "linux_profile" {
    for_each = var.linux_profile
    content {
      admin_username = linux_profile.value.admin_username
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
      outbound_type      = network_profile.value.outbound_type
      pod_cidr           = network_profile.value.pod_cidr
      service_cidr       = network_profile.value.service_cidr
      load_balancer_sku  = network_profile.value.load_balancer_sku
      load_balancer_profile {
        managed_outbound_ip_count = network_profile.value.managed_outbound_ip_count
        outbound_ip_prefix_ids    = network_profile.value.outbound_ip_prefix_ids
        outbound_ip_address_ids   = network_profile.value.outbound_ip_address_ids
      }
    }
  }

  node_resource_group     = var.node_resource_group
  private_cluster_enabled = var.private_cluster_enabled

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

  dynamic "windows_profile" {
    for_each = var.windows_profile
    content {
      admin_username = windows_profile.value.admin_username
      admin_password = windows_profile.value.admin_password
    }
  }
}

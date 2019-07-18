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
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}"
  location            = data.azurerm_resource_group.base.location
  dns_prefix          = var.dns_prefix
  resource_group_name = data.azurerm_resource_group.base.name
  #api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  kubernetes_version = var.kubernetes_version

  agent_pool_profile {
    name           = var.agent_name
    count          = var.agent_count
    vm_size        = var.agent_vm_size
    os_type        = var.agent_os
    vnet_subnet_id = var.subnet_id
    type           = var.agent_type
  }
  linux_profile {
    admin_username = var.admin_user_name

    ssh_key {
      key_data = file(var.public_ssh_key_path)
    }
  }
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
  network_profile {
    network_plugin     = var.network_plugin
    dns_service_ip     = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr
    service_cidr       = var.service_cidr
  }
  /*
  addon_profile {
    http_application_routing {
      enabled = var.http_application_routing_enabled
    }
    oms_agent {
      enabled                    = var.oms_agent_enabled
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
    aci_connector_linux {
      enabled     = var.aci_connector_linux_enabled
      subnet_name = var.aci_subnet_name
    }
  }
  role_based_access_control {
    azure_active_directory {
      client_app_id     = var.client_app_id
      server_app_id     = var.server_app_id
      server_app_secret = var.server_app_secret
      tenant_id         = var.tenant_id
    }
    enabled = var.rbac_enabled
  }
  */
  tags = var.tags
}


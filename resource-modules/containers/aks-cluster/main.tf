###########################
#Setting up Locals for Tags
###########################

locals {
  mandatory_tags = {
    Owner         = var.owner_tag
    region        = var.region_tag
    Cost-Center   = var.cost_center_tag
    Approver      = var.approver_tag
    Service-Hours = var.service_hours_tag

  }
}

###########################
# Setting up Resource Group
###########################

data "azurerm_resource_group" "aks" {
  name = var.resource_group
}

################
# Setting up AKS
################

resource "azurerm_kubernetes_cluster" "main" {
  name       = var.aks_name
  location   = data.azurerm_resource_group.aks.location
  dns_prefix = var.aks_dns_prefix

  resource_group_name = data.azurerm_resource_group.aks.name

  linux_profile {
    admin_username = var.admin_user_name

    ssh_key {
      key_data = file(var.public_ssh_key_path)
    }
  }

  addon_profile {
    http_application_routing {
      enabled = false
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
    aci_connector_linux {
      enabled     = true
      subnet_name = var.aks_aci_subnet_name
    }
  }

  kubernetes_version = var.aks_version

  role_based_access_control {
    # NOTE: in a Production environment these should be different values than Service Principal 
    azure_active_directory {
      client_app_id     = var.aks_client_id
      server_app_id     = var.aks_server_id
      server_app_secret = var.aks_server_client_secret
      tenant_id         = var.tenant_id
    }
    enabled = true
  }

  #api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges

  agent_pool_profile {
    name           = "agentpool"
    count          = var.aks_agent_count
    vm_size        = var.aks_agent_vm_size
    os_type        = "Linux"
    vnet_subnet_id = var.aks_subnet_id
    type           = var.aks_agent_type
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = var.aks_dns_service_ip
    docker_bridge_cidr = var.aks_docker_bridge_cidr
    service_cidr       = var.aks_service_cidr
  }

  tags = merge(local.mandatory_tags, var.optional_tags)
}


###
#  resource composition
###

#kubernetes_cluster_node_pool

provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster_node_pool" "base" {
  orchestrator_version         = var.kubernetes_version
  name                         = var.node_pool_name
  kubernetes_cluster_id        = var.kubernetes_cluster_id
  vm_size                      = var.vm_size
  availability_zones           = var.availability_zones
  enable_auto_scaling          = var.enable_auto_scaling
  enable_node_public_ip        = var.enable_node_public_ip
  max_pods                     = var.max_pods
  max_count                    = var.max_count
  min_count                    = var.min_count
  node_count                   = var.node_count
  priority                     = var.priority
  spot_max_price               = var.spot_max_price
  eviction_policy              = var.eviction_policy
  mode                         = var.mode
  node_labels                  = var.node_labels
  node_taints                  = var.node_taints
  os_disk_size_gb              = var.os_disk_size_gb
  os_disk_type                 = var.os_disk_type
  os_type                      = var.os_type
  proximity_placement_group_id = var.proximity_placement_group_id
  vnet_subnet_id               = var.vnet_subnet_id
  tags                         = var.tags
}

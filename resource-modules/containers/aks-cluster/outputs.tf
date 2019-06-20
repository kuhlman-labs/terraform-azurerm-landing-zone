output "aks_id" {
  value = azurerm_kubernetes_cluster.main.*.id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.main.*.fqdn
}

output "aks_node_resource_group" {
  value = azurerm_kubernetes_cluster.main.*.node_resource_group
}

output "aks_kube_admin_config_raw" {
  value = azurerm_kubernetes_cluster.main.*.kube_admin_config_raw
}

output "aks_kube_admin_config_client_key" {
  value = azurerm_kubernetes_cluster.main.kube_admin_config.*.client_key
}

output "aks_kube_admin_config_client_certificate" {
  value = azurerm_kubernetes_cluster.main.kube_admin_config.*.client_certificate
}

output "aks_kube_admin_config_cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.main.kube_admin_config.*.cluster_ca_certificate
}

output "aks_kube_admin_config_host" {
  value = azurerm_kubernetes_cluster.main.kube_admin_config.*.host
}

output "aks_kube_admin_config_username" {
  value = azurerm_kubernetes_cluster.main.kube_admin_config.*.username
}

output "aks_kube_admin_config_password" {
  value = azurerm_kubernetes_cluster.main.kube_admin_config.*.password
}

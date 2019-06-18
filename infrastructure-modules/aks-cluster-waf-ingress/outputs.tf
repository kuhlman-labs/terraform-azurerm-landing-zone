output "appgw_id" {
  value = module.aks_waf.appgw_id
}

output "aks_id" {
  value = module.aks_cluster.aks_id
}

output "aks_fqdn" {
  value = module.aks_cluster.aks_fqdn
}

output "aks_node_resource_group" {
  value = module.aks_cluster.aks_node_resource_group
}

output "aks_kube_admin_config_raw" {
  value = module.aks_cluster.aks_kube_admin_config_raw
}

output "aks_kube_admin_config_client_key" {
  value = module.aks_cluster.aks_kube_admin_config_client_key
}

output "aks_kube_admin_config_client_certificate" {
  value = module.aks_cluster.aks_kube_admin_config_client_certificate
}

output "aks_kube_admin_config_client_ca_certificate" {
  value = module.aks_cluster.aks_kube_admin_config_client_ca_certificate
}

output "aks_kube_admin_config_host" {
  value = module.aks_cluster.aks_kube_admin_config_host
}

output "aks_kube_admin_config_username" {
  value = module.aks_cluster.aks_kube_admin_config_username
}

output "aks_kube_admin_config_password" {
  value = module.aks_cluster.aks_kube_admin_config_password
}

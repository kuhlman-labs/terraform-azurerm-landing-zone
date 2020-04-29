
# Module `resources/azure/containers/aks-cluster`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** `~> 1.32.0`

## Input Variables
* `addon_profile` (required): https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#addon_profile
* `agent_pool_profile` (default `[{"availability_zones":null,"count":"1","enable_autoscaling":"true","max_count":"3","maxpods":null,"min_count":"1","name":"default","node_taints":null,"os_disk_size_gb":"30","os_type":"Linux","type":"VirtualMachineScaleSets","vm_size":"Standard_B2s","vnet_subnet_id":null}]`): https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#agent_pool_profile
* `api_server_authorized_ip_ranges` (required): The IP ranges to whitelist for incoming traffic to the masters
* `client_id` (required):  The Client ID for the Service Principal. Changing this forces a new resource to be created
* `client_secret` (required): The Client Secret for the Service Principal. Changing this forces a new resource to be created.
* `dns_prefix` (default `"agents"`): DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created.
* `kubernetes_version` (required): Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade).
* `linux_profile` (required): https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#linux_profile
* `network_profile` (required): https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#network_profile
* `node_resource_group` (required): (Optional) The name of the resource Group where the the Kubernetes Nodes should exist. Changing this forces a new resource to be created.
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"aks-cluster"`): Short prefix to identify resource
* `role_based_access_control` (required): https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#role_based_access_control
* `tags` (required): Optional tags to be added to resource
* `windows_profile` (required): https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#windows_profile

## Output Values
* `fqdn`
* `id`
* `kube_config_client_certificate`
* `kube_config_client_key`
* `kube_config_cluster_ca_certificate`
* `kube_config_host`
* `kube_config_password`
* `kube_config_raw`
* `kube_config_username`
* `node_resource_group`

## Managed Resources
* `azurerm_kubernetes_cluster.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


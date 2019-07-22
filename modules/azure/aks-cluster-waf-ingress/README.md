
# Module `modules/azure/aks-cluster-waf-ingress`

Provider Requirements:
* **azurerm:** (any version)
* **helm:** (any version)
* **null:** (any version)

## Input Variables
* `admin_user_name` (required): The Admin Username for the Cluster. Changing this forces a new resource to be created.
* `client_secret` (required): The Client Secret for the Service Principal. Changing this forces a new resource to be created.
* `dns_service_ip` (required): IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `docker_bridge_cidr` (required): IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `region` (required): Geographic Region resource will be deployed into
* `service_cidr` (required): The Network Range used by the Kubernetes service. This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `subnet_aks_nodes_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_app_gw_address_prefix` (required): The address prefix to use for the subnet.
* `tags` (required): Optional tags to be added to resource
* `vnet_name` (required): The name of the Vnet.
* `vnet_rg` (required): The Resource Group of the Vnet

## Output Values
* `aks_fqdn`: The FQDN of the Azure Kubernetes Managed Cluster.
* `aks_id`: The ID of the Kubernetes Managed Cluster.
* `aks_kube_config_client_certificate`: Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster.
* `aks_kube_config_client_key`: Base64 encoded private key used by clients to authenticate to the Kubernetes cluster.
* `aks_kube_config_cluster_ca_certificate`: Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster.
* `aks_kube_config_host`: The Kubernetes cluster server host.
* `aks_kube_config_password`: A password or token used to authenticate to the Kubernetes cluster.
* `aks_kube_config_raw`: Raw Kubernetes config for the admin account to be used by kubectl and other compatible tools.
* `aks_kube_config_username`: A username used to authenticate to the Kubernetes cluster.
* `aks_node_resource_group`: Auto-generated Resource Group containing AKS Cluster resources.

## Managed Resources
* `helm_release.ingress-azure` from `helm`
* `null_resource.aks_config` from `null`

## Data Resources
* `data.azurerm_client_config.current` from `azurerm`

## Child Modules
* `aks_cluster` from `../../../resources/azure/containers/aks-cluster`
* `aks_role_assignment_1` from `../../../resources/azure/governance/role-assignment`
* `aks_role_assignment_2` from `../../../resources/azure/governance/role-assignment`
* `aks_role_assignment_3` from `../../../resources/azure/governance/role-assignment`
* `aks_role_assignment_4` from `../../../resources/azure/governance/role-assignment`
* `aks_subnet` from `../../../resources/azure/network/vnet-subnet`
* `aks_user_assigned_identity` from `../../../resources/azure/governance/user-assigned-identity`
* `resource_group` from `../../../resources/azure/resource-group`
* `waf` from `../../../resources/azure/network/application-gateway`
* `waf_public_ip` from `../../../resources/azure/network/public-ip`
* `waf_subnet` from `../../../resources/azure/network/vnet-subnet`


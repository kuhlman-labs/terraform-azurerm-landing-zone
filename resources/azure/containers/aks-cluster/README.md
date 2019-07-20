
# Module `resources/containers/aks-cluster`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `aci_connector_linux_enabled` (default `"false"`): (Required) Is the virtual node addon enabled?
* `aci_subnet_name` (required): The subnet name for the virtual nodes to run.
* `admin_user_name` (required): The Admin Username for the Cluster. Changing this forces a new resource to be created.
* `agent_count` (default `"1"`): Number of Agents (VMs) in the Pool. Possible values must be in the range of 1 to 100 (inclusive). Defaults to 1.
* `agent_name` (default `"agentpool"`): (Required) Unique name of the Agent Pool Profile in the context of the Subscription and Resource Group. Changing this forces a new resource to be created.
* `agent_os` (default `"Linux"`): (Optional) The Operating System used for the Agents. Possible values are Linux and Windows. Changing this forces a new resource to be created. Defaults to Linux.
* `agent_type` (required): Type of the Agent Pool. Possible values are AvailabilitySet and VirtualMachineScaleSets. Changing this forces a new resource to be created. Defaults to AvailabilitySet.
* `agent_vm_size` (default `"Standard_B2s"`): The size of each VM in the Agent Pool (e.g. Standard_F1). Changing this forces a new resource to be created.
* `api_server_authorized_ip_ranges` (required): The IP ranges to whitelist for incoming traffic to the masters
* `client_app_id` (required):  The Client ID of an Azure Active Directory Application. Changing this forces a new resource to be created.
* `client_id` (required):  The Client ID for the Service Principal. Changing this forces a new resource to be created
* `client_secret` (required): The Client Secret for the Service Principal. Changing this forces a new resource to be created.
* `dns_prefix` (default `"agents"`): DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created.
* `dns_service_ip` (required): IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `docker_bridge_cidr` (required): IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `http_application_routing_enabled` (default `"false"`): (Required) Is HTTP Application Routing Enabled? Changing this forces a new resource to be created.
* `kubernetes_version` (required): Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade).
* `log_analytics_workspace_id` (required): The ID of the Log Analytics Workspace which the OMS Agent should send data to.
* `name` (required): The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created.
* `network_plugin` (required):  (Required) Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created.
* `oms_agent_enabled` (default `"false"`): (Required) Is the OMS Agent Enabled?
* `public_ssh_key_path` (required): The Public SSH Key used to access the cluster. Changing this forces a new resource to be created.
* `rbac_enabled` (default `"false"`): (Required) Is Role Based Access Control Enabled? Changing this forces a new resource to be created.
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"aks-cluster"`): Short prefix to identify resource
* `server_app_id` (required): The Server ID of an Azure Active Directory Application. Changing this forces a new resource to be created.
* `server_app_secret` (required): The Server Secret of an Azure Active Directory Application. Changing this forces a new resource to be created.
* `service_cidr` (required): The Network Range used by the Kubernetes service. This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `subnet_id` (required): The ID of the Subnet where the Agents in the Pool should be provisioned. Changing this forces a new resource to be created.
* `tags` (required): Optional tags to be added to resource
* `tenant_id` (required): The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used. Changing this forces a new resource to be created.

## Output Values
* `aks_fqdn`
* `aks_id`
* `aks_kube_config_client_certificate`
* `aks_kube_config_client_key`
* `aks_kube_config_cluster_ca_certificate`
* `aks_kube_config_host`
* `aks_kube_config_password`
* `aks_kube_config_raw`
* `aks_kube_config_username`
* `aks_node_resource_group`

## Managed Resources
* `azurerm_kubernetes_cluster.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


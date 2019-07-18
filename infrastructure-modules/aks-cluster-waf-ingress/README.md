
# Module `infrastructure-modules/aks-cluster-waf-ingress`

Provider Requirements:
* **azurerm:** (any version)
* **helm:** (any version)
* **kubernetes:** (any version)
* **null:** (any version)
* **terraform:** (any version)

## Input Variables
* `access_key` (required): access key for the storage account that contains the Remote Backend
* `admin_user_name` (required): The Admin Username for the Cluster. Changing this forces a new resource to be created.
* `aks_aci_subnet_name` (required): The subnet name for the virtual nodes to run.
* `aks_agent_count` (required): Number of Agents (VMs) in the Pool. Possible values must be in the range of 1 to 100 (inclusive). Defaults to 1.
* `aks_agent_type` (required): Type of the Agent Pool. Possible values are AvailabilitySet and VirtualMachineScaleSets. Changing this forces a new resource to be created. Defaults to AvailabilitySet.
* `aks_agent_vm_size` (required): The size of each VM in the Agent Pool (e.g. Standard_F1). Changing this forces a new resource to be created.
* `aks_client_id` (required): The Client ID of an Azure Active Directory Application. Changing this forces a new resource to be created.
* `aks_dns_service_ip` (required): IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `aks_docker_bridge_cidr` (required): IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `aks_server_client_secret` (required): The Server Secret of an Azure Active Directory Application. Changing this forces a new resource to be created.
* `aks_server_id` (required): The Server ID of an Azure Active Directory Application. Changing this forces a new resource to be created.
* `aks_server_object_id` (required): The Object ID of the AKS Server to assign the Role Definition to. Changing this forces a new resource to be created.
* `aks_service_cidr` (required): The Network Range used by the Kubernetes service. This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `aks_subnet_id` (required): The ID of the Subnet where the Agents in the Pool should be provisioned. Changing this forces a new resource to be created.
* `aks_version` (required): Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade).
* `api_server_authorized_ip_ranges` (required): The IP ranges to whitelist for incoming traffic to the masters
* `appgw_subnet_id` (required): The ID of a Subnet.
* `appgw_vnet_name` (required): Name of the Vnet that the appgw is in
* `client_id` (required):  The Client ID for the Service Principal. Changing this forces a new resource to be created
* `client_secret` (required): The Client Secret for the Service Principal. Changing this forces a new resource to be created.
* `container_name` (required): Storage account container that contains Remote Backend, e.g. tfstate
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `log_analytics_workspace_id` (required): The ID of the Log Analytics Workspace which the OMS Agent should send data to.
* `region` (required): Geographic Region resource will be deployed into
* `shared_state_key` (required): Key for the shared services State file, e.g. shared-services.tfstate
* `storage_account_name` (required): Storage account that contains Remote Backend, e.g. terraformdata24321
* `tags` (required): Optional tags to be added to resource
* `tenant_id` (required): The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used. Changing this forces a new resource to be created.

## Output Values
* `aks_fqdn`: The FQDN of the Azure Kubernetes Managed Cluster.
* `aks_id`: The ID of the Kubernetes Managed Cluster.
* `aks_kube_admin_config_client_certificate`: Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster.
* `aks_kube_admin_config_client_key`: Base64 encoded private key used by clients to authenticate to the Kubernetes cluster.
* `aks_kube_admin_config_cluster_ca_certificate`: Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster.
* `aks_kube_admin_config_host`: The Kubernetes cluster server host.
* `aks_kube_admin_config_password`: A password or token used to authenticate to the Kubernetes cluster.
* `aks_kube_admin_config_raw`: Raw Kubernetes config for the admin account to be used by kubectl and other compatible tools. This is only available when Role Based Access Control with Azure Active Directory is enabled.
* `aks_kube_admin_config_username`: A username used to authenticate to the Kubernetes cluster.
* `aks_node_resource_group`: Auto-generated Resource Group containing AKS Cluster resources.

## Managed Resources
* `helm_release.ingress-azure` from `helm`
* `kubernetes_cluster_role_binding.tiller-cluster-rule` from `kubernetes`
* `kubernetes_service_account.tiller_sa` from `kubernetes`
* `null_resource.aks_status` from `null`

## Data Resources
* `data.azurerm_subscription.current` from `azurerm`
* `data.terraform_remote_state.shared_services` from `terraform`

## Child Modules
* `aks_cluster` from `../../resource-modules/containers/aks-cluster`
* `aks_role_assignment_1` from `../../resource-modules/governance/role-assignment`
* `aks_role_assignment_2` from `../../resource-modules/governance/role-assignment`
* `aks_role_assignment_3` from `../../resource-modules/governance/role-assignment`
* `aks_role_assignment_4` from `../../resource-modules/governance/role-assignment`
* `aks_user_assigned_identity` from `../../resource-modules/governance/user-assigned-identity`
* `resource_group` from `../../resource-modules/resource-group`
* `waf` from `../../resource-modules/network/application-gateway`
* `waf_public_ip` from `../../resource-modules/network/public-ip`


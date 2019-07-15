
# Module `solutions/pre-prod/`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `access_key` (required): access key for the storage account that contains the Remote Backend
* `admin_user_name` (required): The Admin Username for the Cluster. Changing this forces a new resource to be created.
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
* `aks_version` (required): Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade).
* `api_server_authorized_ip_ranges` (required): The IP ranges to whitelist for incoming traffic to the masters
* `app_id` (required): The client ID for the Service Principal
* `client_secret` (required): The secret for the Service Principal authentication
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `nsg_rules` (required): List of NSG rules
* `region` (required): Geographic region resource will be deployed into
* `route_address_prefix` (required): The destination CIDR to which the route applies, such as 10.1.0.0/16
* `shared_services_subscription_id` (required): subscription id of shared-services env
* `state_key` (required): Key for the state file of the solution, e.g. pre-prod.tfstate
* `storage_account_name` (required): Storage account that contains Remote Backend, e.g. terraformdata24321
* `subnet_aks_nodes_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_virtual_node_aci_address_prefix` (required): The address prefix to use for the subnet.
* `subscription_id` (required): The Id of the Subscription that should contain the created resources
* `tags` (required): A map of tags to add to all resources
* `tenant_id` (required): The tenant ID for the Service Principal
* `vnet_address_ranges` (required): This is a list of the ip address ranges for the vnet

## Output Values
* `pre_prod_vnet_spoke_name`: Generated name of the Virtual Network
* `pre_prod_vnet_spoke_rg`: Generated name of the Virtual Network resource group

## Child Modules
* `aks_cluster_waf_ingress` from `../../infrastructure-modules/aks-cluster-waf-ingress`
* `log_analytics` from `../../infrastructure-modules/log-analytics`
* `network_spoke` from `../../infrastructure-modules/network-spoke`


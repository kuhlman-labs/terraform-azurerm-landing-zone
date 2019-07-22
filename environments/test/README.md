
# Module `environments/test`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `access_key` (required): access key for the storage account that contains the Remote Backend
* `admin_user_name` (required): The Admin Username for the Cluster. Changing this forces a new resource to be created.
* `app_id` (required): The client ID for the Service Principal
* `client_secret` (required): The secret for the Service Principal authentication
* `dns_service_ip` (required): IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `docker_bridge_cidr` (required): IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `hub_vnet_address_ranges` (required): This is a list of the ip address ranges for the vnet
* `nsg_rules_dmz` (required): List of NSG rules for DMZ subnet
* `region` (required): Geographic region resource will be deployed into
* `service_cidr` (required): The Network Range used by the Kubernetes service. This is required when network_plugin is set to azure. Changing this forces a new resource to be created.
* `shared_services_subscription_id` (required): subscription id of shared-services env
* `spoke_vnet_address_ranges` (required): This is a list of the ip address ranges for the vnet
* `state_key` (required): Key for the state file of the solution, e.g. pre-prod.tfstate
* `storage_account_name` (required): Storage account that contains Remote Backend, e.g. terraformdata24321
* `subnet_aks_nodes_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_app_gw_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_backend_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_dmz_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_frontend_address_prefix` (required): The address prefix to use for the subnet.
* `subscription_id` (required): The Id of the Subscription that should contain the created resources
* `tags` (required): A map of tags to add to all resources
* `tenant_id` (required): The tenant ID for the Service Principal

## Output Values
* `test_vnet_id`: Resource id of the hub virtual network
* `test_vnet_name`: Generated name of the hub virtual network
* `test_vnet_rg`: Generated name of the resource group for hub virtual network

## Child Modules
* `aks_cluster_waf_ingress` from `../../modules/azure/aks-cluster-waf-ingress`
* `key_vault_with_p2s_cert` from `../../modules/azure/key-vault-with-p2s-cert`
* `log_analytics` from `../../modules/azure/log-analytics`
* `network_hub` from `../../modules/azure/network-hub`
* `network_spoke` from `../../modules/azure/network-spoke`



# Module `solutions/shared-services/`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `access_key` (required): access key for the storage account that contains the Remote Backend
* `aks_client_id` (required): The Client ID of an Azure Active Directory Application. Changing this forces a new resource to be created.
* `aks_server_client_secret` (required): The Server Secret of an Azure Active Directory Application. Changing this forces a new resource to be created.
* `aks_server_id` (required): The Server ID of an Azure Active Directory Application. Changing this forces a new resource to be created.
* `aks_server_object_id` (required): The Object ID of the AKS Server to assign the Role Definition to. Changing this forces a new resource to be created.
* `app_id` (required): The client ID for the Service Principal
* `client_address_spaces` (required): The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation
* `client_secret` (required): The secret for the Service Principal authentication
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `nsg_rules_dmz` (required): List of NSG rules for DMZ subnet
* `region` (required): Geographic region resource will be deployed into
* `shared_services_subscription_id` (required): subscription id of shared-services env
* `state_key` (required): Key for the state file of the solution, e.g. pre-prod.tfstate
* `storage_account_name` (required): Storage account that contains Remote Backend, e.g. terraformdata24321
* `subnet_app_gw_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_dmz_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_firewall_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_gateway_address_prefix` (required): The address prefix to use for the subnet.
* `subscription_id` (required): The Id of the Subscription that should contain the created resources
* `tags` (required): A map of tags to add to all resources
* `tenant_id` (required): The tenant ID for the Service Principal
* `vnet_address_ranges` (required): This is a list of the ip address ranges for the vnet
* `vpn_client_protocols` (required): List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN.

## Output Values
* `shared_services_appgw_id`
* `shared_services_firewall_private_ip`
* `shared_services_firewall_public_ip`
* `shared_services_subnet_app_gw_id`
* `shared_services_vnet_id`: Resource id of the hub virtual network
* `shared_services_vnet_name`: Generated name of the hub virtual network
* `shared_services_vnet_rg`: Generated name of the resource group for hub virtual network

## Child Modules
* `log_analytics` from `../../infrastructure-modules/log-analytics`
* `network_hub` from `../../infrastructure-modules/network-hub`


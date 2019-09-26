
# Module `environments/shared-services`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** `~> 1.32.0`

## Input Variables
* `access_key` (required): access key for the storage account that contains the Remote Backend
* `app_id` (required): The client ID for the Service Principal
* `client_secret` (required): The secret for the Service Principal authentication
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `nsg_rules_dmz` (required): List of NSG rules for DMZ subnet
* `region` (required): Geographic region resource will be deployed into
* `shared_services_subscription_id` (required): subscription id of shared-services env
* `state_key` (required): Key for the state file of the solution, e.g. pre-prod.tfstate
* `storage_account_name` (required): Storage account that contains Remote Backend, e.g. terraformdata24321
* `subnet_dmz_address_prefix` (required): The address prefix to use for the subnet.
* `subscription_id` (required): The Id of the Subscription that should contain the created resources
* `tags` (required): A map of tags to add to all resources
* `tenant_id` (required): The tenant ID for the Service Principal
* `vnet_address_ranges` (required): This is a list of the ip address ranges for the vnet

## Output Values
* `shared_services_vnet_id`: Resource id of the hub virtual network
* `shared_services_vnet_name`: Generated name of the hub virtual network
* `shared_services_vnet_rg`: Generated name of the resource group for hub virtual network

## Child Modules
* `network_hub` from `../../modules/azure/network-hub`



# Module `.`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `access_key` (required): access key for the storage account that contains the Remote Backend
* `app_id` (required): The client ID for the Service Principal
* `client_secret` (required): The secret for the Service Principal authentication
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `region` (required): Geographic region resource will be deployed into
* `shared_services_subscription_id` (required): subscription id of shared-services env
* `state_key` (required): Key for the state file of the solution, e.g. pre-prod.tfstate
* `storage_account_name` (required): Storage account that contains Remote Backend, e.g. terraformdata24321
* `subnet_backend_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_frontend_address_prefix` (required): The address prefix to use for the subnet.
* `subscription_id` (required): The Id of the Subscription that should contain the created resources
* `tags` (required): A map of tags to add to all resources
* `tenant_id` (required): The tenant ID for the Service Principal
* `vnet_address_ranges` (required): This is a list of the ip address ranges for the vnet

## Output Values
* `prod_vnet_spoke_name`: Generated name of the Virtual Network
* `prod_vnet_spoke_rg`: Generated name of the Virtual Network resource group

## Child Modules
* `network_spoke` from `../../infrastructure-modules/network-spoke`


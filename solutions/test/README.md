
# Module `solutions/test`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `app_id` (required): The client ID for the Service Principal
* `client_secret` (required): The secret for the Service Principal authentication
* `subscription_id` (required): The Id of the Subscription that should contain the created resources
* `tenant_id` (required): The tenant ID for the Service Principal

## Managed Resources
* `azurerm_resource_group.test` from `azurerm`


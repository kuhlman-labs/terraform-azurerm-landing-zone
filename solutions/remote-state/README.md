
# Module `.`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `app_id` (required): The client ID for the Service Principal
* `client_secret` (required): The secret for the Service Principal authentication
* `environment` (required): The environment that the resource group is holding state
* `region` (required): The region where the stroage account will be created
* `storage_account_name` (required): The name of the storage account which must be globally unique
* `subscription_id` (required): The Id of the Subscription that should contain the created resources
* `tenant_id` (required): The tenant ID for the Service Principal

## Output Values
* `terraform_state_primary_shared_key`: Primary access key for the state storage account
* `terraform_state_storage_account_name`: Name of the state storage account

## Managed Resources
* `azurerm_resource_group.terraform_state` from `azurerm`
* `azurerm_storage_account.terraform_state_storage_account` from `azurerm`
* `azurerm_storage_container.terraform-state-container` from `azurerm`


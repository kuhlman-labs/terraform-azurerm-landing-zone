
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
* `subscription_id` (required): The Id of the Subscription that should contain the created resources
* `tags` (required): A map of tags to add to all resources
* `tenant_id` (required): The tenant ID for the Service Principal

## Output Values
* `log_analytics_id`: Log Analytics Workspace id
* `log_analytics_primary_shared_key`: Primary shared key for the Log Analytics Workspace
* `log_analytics_workspace_id`: Workspace (or Customer) ID for the Log Analytics Workspace

## Child Modules
* `log_analytics` from `../../infrastructure-modules/log-analytics`


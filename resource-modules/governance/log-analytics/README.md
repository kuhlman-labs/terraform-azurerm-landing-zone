
# Module `resource-modules/governance/log-analytics`

Provider Requirements:
* **azurerm:** (any version)
* **random:** (any version)

## Input Variables
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"log-aw"`): a short pre-defined text to identify resource type
* `retention_period` (default `30`): Time in days to retain logs in the log analytics workspace
* `sku` (default `"PerGB2018"`): sku for Log Analytics Workspace
* `tags` (required): Optional tags to be added to resource

## Output Values
* `log_analytics_id`: Log Analytics Workspace id
* `log_analytics_primary_shared_key`: Primary shared key for the Log Analytics Workspace
* `log_analytics_workspace_id`: Workspace (or Customer) ID for the Log Analytics Workspace

## Managed Resources
* `azurerm_log_analytics_workspace.base` from `azurerm`
* `random_string.base` from `random`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


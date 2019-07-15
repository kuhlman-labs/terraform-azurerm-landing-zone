# Module `infrastructure-modules/log-analytics/`

## Input Variables
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `region` (required): Geographic region resource will be deployed into
* `resource_prefix` (default `"logaw"`): a short pre-defined text to identify resource type
* `retention_period` (default `30`): Time in days to retain logs in the log analytics workspace
* `sku` (default `"PerGB2018"`): SKU for Log Analytics Workspace
* `tags` (required): Optional tags to be added to resource

## Output Values
* `log_analytics_id`: Log Analytics Workspace id
* `log_analytics_primary_shared_key`: Primary shared key for the Log Analytics Workspace
* `log_analytics_workspace_id`: Workspace (or Customer) ID for the Log Analytics Workspace

## Child Modules
* `log-analytics` from `../../resource-modules/governance/log-analytics`
* `resource_group` from `../../resource-modules/resource-group`
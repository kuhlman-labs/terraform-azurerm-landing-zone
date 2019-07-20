
# Module `modules/log-analytics`

## Input Variables
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `region` (required): Geographic region resource will be deployed into
* `resource_prefix` (default `"logaw"`): a short pre-defined text to identify resource type
* `retention_period` (default `30`): Time in days to retain logs in the log analytics workspace
* `sku` (default `"PerGB2018"`): SKU for Log Analytics Workspace
* `tags` (required): Optional tags to be added to resource

## Output Values
* `log_analytics_id`: log analytics resource id
* `log_analytics_primary_shared_key`: primary shared key for the Log Analytics Workspace
* `log_analytics_workspace_id`: workspace (or customer) ID for the log analytics workspace

## Child Modules
* `log-analytics` from `../../resources/azure/governance/log-analytics`
* `resource_group` from `../../resources/azure/resource-group`


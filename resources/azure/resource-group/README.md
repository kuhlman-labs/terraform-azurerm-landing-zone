
# Module `resources/resource-group`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `region` (required): Geographic region resource will be deployed into
* `resource_prefix` (required): A short pre-defined text to identify the resource type

## Output Values
* `resource_group_id`: resource group id
* `resource_group_name`: resource group name

## Managed Resources
* `azurerm_resource_group.base` from `azurerm`


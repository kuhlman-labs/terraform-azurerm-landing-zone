
# Module `resource-modules/backup/recovery-services-vault/`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `approver_tag` (required): Financial; Unique - email address
* `cost_center_tag` (required): Financial; Unique - Code provided directly from Finance (BU/Brand)
* `optional_tags` (required): Optional tags to be added to resource
* `owner_tag` (required): APP/Technical; Email address of App/Product Owner
* `region_tag` (required): Financial; i.e. Sharepoint Global
* `resource_group` (required): The name of the target resource group
* `service_hours_tag` (required): Automation/Security; Sort -FullTime\|Weekdays...
* `sku` (default `"Standard"`): SKU for Recovery Services Vault

## Output Values
* `recovery_services_id`: Recovery Services Vault resource id

## Managed Resources
* `azurerm_recovery_services_vault.main` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.vault` from `azurerm`


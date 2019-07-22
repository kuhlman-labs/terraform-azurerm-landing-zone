
# Module `resources/azure/backup/recovery-services-vault`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"recovery-services-vault"`): Short prefix to identify resource
* `sku` (default `"Standard"`): SKU for Recovery Services Vault
* `tags` (required): tags to be added to resource

## Output Values
* `recovery_services_id`: Recovery Services Vault resource id

## Managed Resources
* `azurerm_recovery_services_vault.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


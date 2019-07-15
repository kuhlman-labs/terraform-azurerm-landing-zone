
# Module `resource-modules/governance/key-vault/`

Provider Requirements:
* **azurerm:** (any version)
* **random:** (any version)

## Input Variables
* `approver_tag` (required): Financial; Unique - email address
* `cost_center_tag` (required): Financial; Unique - Code provided directly from Finance (BU/Brand)
* `object_id` (required): The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies.
* `optional_tags` (required): Optional tags to be added to resource
* `owner_tag` (required): APP/Technical; Email address of App/Product Owner
* `region_tag` (required): Financial; i.e. Sharepoint Global
* `resource_group` (required): The name of the target resource group
* `service_hours_tag` (required): Automation/Security; Sort -FullTime\|Weekdays...
* `sku` (default `"standard"`): The Name of the sku used for this Key Vault. Possible values are standard and premium.
* `tenant_id` (required): The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault.

## Output Values
* `key_vault_id`: Key Vault resource id

## Managed Resources
* `azurerm_key_vault.main` from `azurerm`
* `random_string.kv` from `random`

## Data Resources
* `data.azurerm_client_config.current` from `azurerm`
* `data.azurerm_resource_group.key_vault` from `azurerm`


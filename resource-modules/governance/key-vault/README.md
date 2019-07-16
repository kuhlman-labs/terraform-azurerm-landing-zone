
# Module `.`

Provider Requirements:
* **azurerm:** (any version)
* **random:** (any version)

## Input Variables
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"key-vault"`): a short pre-defined text to identify resource type
* `sku` (default `"standard"`): The Name of the sku used for this Key Vault. Possible values are standard and premium.
* `tags` (required): tags to be added to resource

## Output Values
* `key_vault_id`: Key Vault resource id

## Managed Resources
* `azurerm_key_vault.base` from `azurerm`
* `random_string.kv` from `random`

## Data Resources
* `data.azurerm_client_config.current` from `azurerm`
* `data.azurerm_resource_group.base` from `azurerm`


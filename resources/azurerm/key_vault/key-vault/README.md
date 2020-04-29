
# Module `resources/azure/governance/key-vault`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** `~> 1.32.0`
* **random:** (any version)

## Input Variables
* `access_policy` (default `[{"certificate_permissions":["create","delete","deleteissuers","get","getissuers","import","list","listissuers","managecontacts","manageissuers","setissuers","update"],"key_permissions":["backup","create","decrypt","delete","encrypt","get","import","list","purge","recover","restore","sign","unwrapKey","update","verify","wrapKey"],"secret_permissions":["backup","delete","get","list","purge","recover","restore","set"]}]`)
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"key-vault"`): a short pre-defined text to identify resource type
* `sku_name` (default `"standard"`): The Name of the sku used for this Key Vault. Possible values are standard and premium.
* `tags` (required): tags to be added to resource

## Output Values
* `key_vault_id`: Key Vault resource id

## Managed Resources
* `azurerm_key_vault.base` from `azurerm`
* `random_string.base` from `random`

## Data Resources
* `data.azurerm_client_config.current` from `azurerm`
* `data.azurerm_resource_group.base` from `azurerm`


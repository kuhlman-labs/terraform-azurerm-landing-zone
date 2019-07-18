
# Module `resource-modules/governance/key-vault`

Provider Requirements:
* **azurerm:** (any version)
* **random:** (any version)

## Input Variables
* `certificate_permissions` (default `["create","delete","deleteissuers","get","getissuers","import","list","listissuers","managecontacts","manageissuers","setissuers","update"]`): (Optional) List of certificate permissions, must be one or more from the following: backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update.
* `key_permissions` (default `["backup","create","decrypt","delete","encrypt","get","import","list","purge","recover","restore","sign","unwrapKey","update","verify","wrapKey"]`): (Optional) List of key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey.
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"key-vault"`): a short pre-defined text to identify resource type
* `secret_permissions` (default `["backup","delete","get","list","purge","recover","restore","set"]`): (Optional) List of secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set.
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


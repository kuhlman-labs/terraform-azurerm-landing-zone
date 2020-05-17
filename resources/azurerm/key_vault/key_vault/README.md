## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_policy | n/a | `list` | <pre>[<br>  {<br>    "certificate_permissions": [<br>      "create",<br>      "delete",<br>      "deleteissuers",<br>      "get",<br>      "getissuers",<br>      "import",<br>      "list",<br>      "listissuers",<br>      "managecontacts",<br>      "manageissuers",<br>      "setissuers",<br>      "update"<br>    ],<br>    "key_permissions": [<br>      "backup",<br>      "create",<br>      "decrypt",<br>      "delete",<br>      "encrypt",<br>      "get",<br>      "import",<br>      "list",<br>      "purge",<br>      "recover",<br>      "restore",<br>      "sign",<br>      "unwrapKey",<br>      "update",<br>      "verify",<br>      "wrapKey"<br>    ],<br>    "secret_permissions": [<br>      "backup",<br>      "delete",<br>      "get",<br>      "list",<br>      "purge",<br>      "recover",<br>      "restore",<br>      "set"<br>    ]<br>  }<br>]</pre> | no |
| name\_prefix | a short pre-defined text to identify resource type | `string` | `"key-vault"` | no |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| sku\_name | The Name of the sku used for this Key Vault. Possible values are standard and premium. | `string` | `"standard"` | no |
| tags | tags to be added to resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_vault\_id | Key Vault resource id |


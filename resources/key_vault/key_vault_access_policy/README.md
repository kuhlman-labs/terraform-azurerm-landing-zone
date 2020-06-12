## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application\_id | (Optional) The object ID of an Application in Azure Active Directory. | `string` | `null` | no |
| certificate\_permissions | (Optional) List of certificate permissions, must be one or more from the following: backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update. | `list` | `null` | no |
| key\_permissions | (Required) List of key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey. | `list` | n/a | yes |
| key\_vault\_id | (Required) Specifies the id of the Key Vault resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| object\_id | (Required) The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created. | `string` | n/a | yes |
| secret\_permissions | (Required) List of secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set. | `list` | n/a | yes |
| storage\_permissions | (Optional) List of storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update. | `list` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Key Vault Access Policy ID. |


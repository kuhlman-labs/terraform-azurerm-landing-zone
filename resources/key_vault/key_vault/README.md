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
| enabled\_for\_deployment | (Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false. | `bool` | `null` | no |
| enabled\_for\_disk\_encryption | (Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false. | `bool` | `null` | no |
| enabled\_for\_template\_deployment | (Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false. | `bool` | `null` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| name\_prefix | a short pre-defined text to identify resource type | `string` | `"kv"` | no |
| network\_acls | (Optional) A network\_acls block as defined below. | `list` | `[]` | no |
| purge\_protection\_enabled | (Optional) Is Purge Protection enabled for this Key Vault? Defaults to false. | `bool` | `null` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| sku\_name | The Name of the sku used for this Key Vault. Possible values are standard and premium. | `string` | n/a | yes |
| soft\_delete\_enabled | (Optional) Should Soft Delete be enabled for this Key Vault? Defaults to false. | `bool` | `null` | no |
| tags | tags to be added to resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Key Vault resource id |
| vault\_uri | The URI of the Key Vault, used for performing operations on keys and secrets. |


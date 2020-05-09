## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name\_prefix | Short prefix to identify resource | `string` | `"recovery-services-vault"` | no |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| sku | SKU for Recovery Services Vault | `string` | `"Standard"` | no |
| tags | tags to be added to resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| recovery\_services\_id | Recovery Services Vault resource id |


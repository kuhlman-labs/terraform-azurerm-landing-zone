## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name\_prefix | Short prefix to identify resource | `string` | `"rsv"` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| sku | (Required) Sets the vault's SKU. Possible values include: Standard, RS0. | `string` | n/a | yes |
| soft\_delete\_enabled | (Optional) Is soft delete enable for this Vault? Defaults to true. | `bool` | `null` | no |
| tags | tags to be added to resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Recovery Services Vault. |


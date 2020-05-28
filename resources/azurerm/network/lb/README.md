## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| frontend\_ip\_configuration | (Optional) One or multiple frontend\_ip\_configuration blocks as documented below. | `list` | `[]` | no |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"lb"` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| sku | (Optional) The SKU of the Azure Load Balancer. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `null` | no |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The Load Balancer ID. |


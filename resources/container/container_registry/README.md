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
| admin\_enabled | (Optional) Specifies whether the admin user is enabled. Defaults to false. | `bool` | `null` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| georeplication\_locations | (Optional) A list of Azure locations where the container registry should be geo-replicated. | `list` | `null` | no |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"acr"` | no |
| network\_rule\_set | (Optional) A network\_rule\_set block as documented below. | `list` | `[]` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| sku | (Optional) The SKU name of the container registry. Possible values are Basic, Standard and Premium. Classic (which was previously Basic) is supported only for existing resources. | `string` | `null` | no |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Container Registry. |


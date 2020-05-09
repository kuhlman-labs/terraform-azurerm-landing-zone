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
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `""` | no |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

No output.


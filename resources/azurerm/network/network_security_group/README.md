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
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"nsg"` | no |
| policy\_name | policy name or app name | `string` | n/a | yes |
| resource\_group | This is the resource group to which the resources will be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Network Security Group. |
| name | The Name of the Network Security Group. |


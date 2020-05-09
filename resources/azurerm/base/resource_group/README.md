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
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"rg"` | no |
| region | Geographic region resource will be deployed into | `string` | n/a | yes |
| service\_name | Name of the application, service, or workload the resource group is housing. | `string` | n/a | yes |
| tags | (Optional) A mapping of tags which should be assigned to the Resource Group. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Resource Group. |
| location | The location of the Resource Group. |
| name | The Name of this Resource Group. |


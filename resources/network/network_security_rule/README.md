## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"nsg"` | no |
| network\_security\_group\_name | (Required) The name of the Network Security Group that we want to attach the rule to. Changing this forces a new resource to be created. | `string` | n/a | yes |
| network\_security\_rules | List of network security rules | `list` | `[]` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | This is the resource group to which the resources will be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Network Security Rule. |


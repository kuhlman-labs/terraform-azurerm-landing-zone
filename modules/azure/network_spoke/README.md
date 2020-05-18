## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefixes | The address prefixes to use for the subnets. | `list(string)` | n/a | yes |
| address\_space | This is a list of the ip address ranges for the vnet | `list` | n/a | yes |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| subnet\_name\_prefixes | The name of the subnets. Changing this forces a new resource to be created. | `list(string)` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |
| virtual\_network\_hub\_id | The id of the hub virtual network | `string` | n/a | yes |
| virtual\_network\_hub\_name | The name of the hub virtual network | `string` | n/a | yes |
| virtual\_network\_hub\_resource\_group\_name | The name of the hub virtual network resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_id | The subnet ID. |
| subnet\_name | The subnet ID. |
| virtual\_network\_id | resource id of virtual network |
| virtual\_network\_name | resource name of virtual network |
| virtual\_network\_resource\_group\_name | n/a |


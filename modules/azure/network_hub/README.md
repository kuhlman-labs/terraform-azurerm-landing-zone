## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefix\_vgw | The address prefixe to use for the vgw subnet. | `list` | n/a | yes |
| address\_prefixes | The address prefixes to use for the subnets. | `list(string)` | n/a | yes |
| address\_space | This is a list of the ip address ranges for the vnet | `list` | n/a | yes |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| subnet\_name\_prefixes | The name of the subnets. Changing this forces a new resource to be created. | `list(string)` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_id | The subnet ID. |
| subnet\_name | The subnet ID. |
| virtual\_network\_id | resource id of vnet hub |
| virtual\_network\_name | resource name of vnet hub |
| virtual\_network\_resource\_group\_name | n/a |


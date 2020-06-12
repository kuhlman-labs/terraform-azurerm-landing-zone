## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| azurerm | ~> 2.14.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefix\_app | The address prefix to use for the app subnet. | `list(string)` | n/a | yes |
| address\_prefix\_data | The address prefix to use for the data subnet. | `list(string)` | n/a | yes |
| address\_prefix\_glusterfs | The address prefix to use for the glusterfs subnet. | `list(string)` | n/a | yes |
| address\_space | This is a list of the ip address ranges for the vnet | `list` | n/a | yes |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| region | Geographic region resource will be deployed into | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

No output.


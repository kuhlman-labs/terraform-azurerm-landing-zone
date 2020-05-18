## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| storage\_account\_uri | (Required) The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor. | `string` | n/a | yes |
| subnet\_id | (Required) The ID of the Subnet where this Network Interface should be located in. | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

No output.


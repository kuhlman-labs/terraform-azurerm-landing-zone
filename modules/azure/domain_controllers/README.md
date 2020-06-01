## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefix\_adds | (Required) The address prefix for the aads subnet | `list` | n/a | yes |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| private\_ip\_address\_adds | (Required) The Static IP address for the aads Servers | `list` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| storage\_account\_uri | (Required) The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor. | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |
| virtual\_network\_name | (Required) The Name of the Virtual Network where this subnet should be located in. | `string` | n/a | yes |
| virtual\_network\_resource\_group | (Required) The Name of the Virtual Network where this subnet should be located in. | `string` | n/a | yes |
| vm\_size | (Required) The SKU which should be used for this Virtual Machine, such as Standard\_F2. | `string` | `"Standard_B2s"` | no |

## Outputs

No output.


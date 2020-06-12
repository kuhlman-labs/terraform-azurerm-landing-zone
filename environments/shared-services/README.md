## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefix\_adds | The address prefixe to use for the aads subnet. | `list` | n/a | yes |
| address\_prefix\_fw | The address prefixe to use for the fw subnet. | `list` | n/a | yes |
| address\_prefix\_jumpbox | The address prefixe to use for the jumpbox subnet. | `list` | n/a | yes |
| address\_prefix\_vgw | The address prefix to use for the vgw subnet. | `list` | n/a | yes |
| address\_space | This is a list of the ip address ranges for the vnet | `list` | n/a | yes |
| app\_id | The client ID for the Service Principal | `string` | n/a | yes |
| client\_secret | The secret for the Service Principal authentication | `string` | n/a | yes |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| object\_id | The object ID for the Service Principal | `string` | n/a | yes |
| private\_ip\_address\_adds | (Required) The Static IP address for the aads Servers | `list` | n/a | yes |
| region | Geographic region resource will be deployed into | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| network\_transit\_hub\_id | Resource id of the transit hub virtual network |
| network\_transit\_hub\_name | Generated name of the transit hub virtual network |
| network\_transit\_hub\_resource\_group\_name | Generated name of the resource group for the transit hub virtual network |


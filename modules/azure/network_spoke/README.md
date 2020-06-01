## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_space | This is a list of the ip address ranges for the vnet | `list` | n/a | yes |
| allow\_forwarded\_traffic\_hub | (Optional) Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. | `bool` | `true` | no |
| allow\_forwarded\_traffic\_spoke | (Optional) Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. | `bool` | `true` | no |
| allow\_gateway\_transit\_hub | (Required) Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | `bool` | n/a | yes |
| allow\_gateway\_transit\_spoke | (Required) Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | `bool` | n/a | yes |
| allow\_virtual\_network\_access\_hub | (Optional) Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to true. | `bool` | `true` | no |
| allow\_virtual\_network\_access\_spoke | (Optional) Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to true. | `bool` | `true` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |
| use\_remote\_gateways\_hub | (Requred) Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow\_gateway\_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false. | `bool` | n/a | yes |
| use\_remote\_gateways\_spoke | (Required) Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow\_gateway\_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false. | `bool` | n/a | yes |
| virtual\_network\_hub\_id | The id of the hub virtual network | `string` | n/a | yes |
| virtual\_network\_hub\_name | The name of the hub virtual network | `string` | n/a | yes |
| virtual\_network\_hub\_resource\_group\_name | The name of the hub virtual network resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| virtual\_network\_id | resource id of virtual network |
| virtual\_network\_name | resource name of virtual network |
| virtual\_network\_resource\_group\_name | n/a |


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_forwarded\_traffic | (Optional) Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. | `bool` | `null` | no |
| allow\_gateway\_transit | (Optional) Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | `bool` | `null` | no |
| allow\_virtual\_network\_access | (Optional) Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to true. | `bool` | `null` | no |
| remote\_virtual\_network\_id | (Required) The full Azure resource ID of the remote virtual network. Changing this forces a new resource to be created. | `string` | n/a | yes |
| remote\_virtual\_network\_name | (Required) The name of the remote virtual network. Changing this forces a new resource to be created. | `string` | n/a | yes |
| resource\_group\_name | (Required) The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created. | `string` | n/a | yes |
| use\_remote\_gateways | (Optional) Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow\_gateway\_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false. | `bool` | `null` | no |
| virtual\_network\_name | (Required) The name of the virtual network. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| virtual\_network\_peering\_id | The ID of the Virtual Network Peering. |


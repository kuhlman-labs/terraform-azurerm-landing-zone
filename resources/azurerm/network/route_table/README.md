## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| disable\_bgp\_route\_propagation | bool flag which controls propagation of routes learned by BGP on that route table. True means disable. | `bool` | n/a | yes |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"route-table"` | no |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| route\_address\_prefix | The destination CIDR to which the route applies, such as 10.1.0.0/16 | `string` | n/a | yes |
| route\_name | The name of the route. | `string` | n/a | yes |
| route\_next\_hop\_in\_ip\_address | Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance. | `string` | `""` | no |
| route\_next\_hop\_type | The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| route\_table\_id | n/a |
| route\_table\_subnets | n/a |


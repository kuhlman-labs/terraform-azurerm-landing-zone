## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefix | (Required) The destination CIDR to which the route applies, such as 10.1.0.0/16 | `string` | n/a | yes |
| disable\_bgp\_route\_propagation | (Optional) Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable. | `bool` | `null` | no |
| name | (Required) The name of the route. | `string` | n/a | yes |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"route"` | no |
| next\_hop\_in\_ip\_address | (Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance. | `string` | `null` | no |
| next\_hop\_type | (Required) The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None. | `string` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
| subnets | n/a |


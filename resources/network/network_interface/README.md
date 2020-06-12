## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dns\_servers | (Optional) A list of IP Addresses defining the DNS Servers which should be used for this Network Interface. | `list` | `null` | no |
| enable\_accelerated\_networking | (Optional) Should Accelerated Networking be enabled? Defaults to false. | `bool` | `null` | no |
| enable\_ip\_forwarding | (Optional) Should IP Forwarding be enabled? Defaults to false. | `bool` | `null` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| internal\_dns\_name\_label | (Optional) The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network. | `string` | `null` | no |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"nic"` | no |
| nic\_count | Number of nic resources to create | `number` | `1` | no |
| primary | (Optional) Is this the Primary IP Configuration? Must be true for the first ip\_configuration when multiple are specified. Defaults to false. | `bool` | `null` | no |
| private\_ip\_address | (Optional) The Static IP Address which should be used. | `list` | `[]` | no |
| private\_ip\_address\_allocation | (Required) The allocation method used for the Private IP Address. Possible values are Dynamic and Static. | `string` | n/a | yes |
| private\_ip\_address\_version | (Optional) The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4. | `string` | `null` | no |
| public\_ip\_address\_id | (Optional) Reference to a Public IP Address to associate with this NIC | `string` | `null` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | (Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created. | `string` | n/a | yes |
| subnet\_id | (Required) The ID of the Subnet where this Network Interface should be located in. | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Network Interface. |
| ip\_configuration\_name | The name used for this IP Configuration. |


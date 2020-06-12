## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| frontend\_ip\_configuration | (Optional) One or multiple frontend\_ip\_configuration blocks as documented below. | `list` | `[]` | no |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"lb"` | no |
| private\_ip\_address | (Optional) Private IP Address to assign to the Load Balancer. The last one and first four IPs in any range are reserved and cannot be manually assigned. | `string` | `null` | no |
| private\_ip\_address\_allocation | (Optional) The allocation method for the Private IP Address used by this Load Balancer. Possible values as Dynamic and Static. | `string` | `null` | no |
| private\_ip\_address\_version | The version of IP that the Private IP Address is. Possible values are IPv4 or IPv6. | `string` | `"IPv4"` | no |
| public\_ip\_address\_id | (Optional) The ID of a Public IP Address which should be associated with the Load Balancer. | `string` | `null` | no |
| public\_ip\_prefix\_id | (Optional) The ID of a Public IP Prefix which should be associated with the Load Balancer. Public IP Prefix can only be used with outbound rules. | `string` | `null` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| sku | (Optional) The SKU of the Azure Load Balancer. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `null` | no |
| subnet\_id | The ID of the Subnet which should be associated with the IP Configuration. | `string` | `null` | no |
| tags | A map of tags to add to all resources | `map` | `{}` | no |
| zones | (Optional) A list of Availability Zones which the Load Balancer's IP Addresses should be created in. | `list` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The Load Balancer ID. |


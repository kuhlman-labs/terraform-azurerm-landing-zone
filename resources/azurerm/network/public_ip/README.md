## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allocation\_method | (Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic. | `string` | n/a | yes |
| domain\_name\_label | (Optional) Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system. | `string` | `null` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| idle\_timeout\_in\_minutes | (Optional) Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes. | `string` | `null` | no |
| ip\_version | (Optional) The IP Version to use, IPv6 or IPv4. | `string` | `null` | no |
| name\_prefix | a short pre-defined text to identify resource type | `string` | `"pip"` | no |
| public\_ip\_prefix\_id | (Optional) If specified then public IP address allocated will be provided from the public IP prefix resource. | `string` | `null` | no |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| reverse\_fqdn | (Optional) A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN. | `string` | `null` | no |
| sku | (Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `"Basic"` | no |
| tags | Optional tags to be added to resource | `map` | `{}` | no |
| zones | (Optional) A collection containing the availability zone to allocate the Public IP in. | `list` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| fqdn | Fully qualified domain name of the A DNS record associated with the public IP. domain\_name\_label must be specified to get the fqdn. This is the concatenation of the domain\_name\_label and the regionalized DNS zone |
| id | The Public IP ID. |
| ip\_address | The IP address value that was allocated. Note Dynamic Public IP Addresses aren't allocated until they're attached to a device |
| name | The Public IP Name. |


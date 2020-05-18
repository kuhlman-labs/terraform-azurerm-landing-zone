## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefixes | (Required) The address prefixes to use for the azfw subnet. | `list` | n/a | yes |
| name\_prefix | Specifies the name of the Firewall. Changing this forces a new resource to be created. | `string` | `"azfw"` | no |
| public\_ip\_address\_id | (Required) The Resource ID of the Public IP Address associated with the firewall. | `string` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| tags | Optional tags to be added to resource | `map` | `{}` | no |
| virtual\_network\_name | (Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created. | `string` | n/a | yes |
| zones | (Optional) Specifies the availability zones in which the Azure Firewall should be created. | `list` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
| private\_ip\_address | n/a |


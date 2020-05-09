## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefixes | (Optional) The address prefixes to use for the subnet. | `list(string)` | n/a | yes |
| delegation | A List of delegation blocks to associate with the subnet. | `list` | `[]` | no |
| enforce\_private\_link\_endpoint\_network\_policies | (Optional) Enable or Disable network policies for the private link endpoint on the subnet. Default value is false. Conflicts with enforce\_private\_link\_service\_network\_policies. | `bool` | `null` | no |
| enforce\_private\_link\_service\_network\_policies | (Optional) Enable or Disable network policies for the private link service on the subnet. Default valule is false. Conflicts with enforce\_private\_link\_endpoint\_network\_policies. | `bool` | `null` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| name\_prefixes | The name of the subnet. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  "snet"<br>]</pre> | no |
| resource\_group | (Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created. | `string` | n/a | yes |
| service\_endpoints | The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql and Microsoft.Storage. | `list` | `null` | no |
| virtual\_network\_name | (Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| address\_prefixes | The address prefixes for the subnet |
| id | The subnet ID. |
| name | The name of the subnet. |
| resource\_group\_name | The name of the resource group in which the subnet is created in. |
| virtual\_network\_name | The name of the virtual network in which the subnet is created in |


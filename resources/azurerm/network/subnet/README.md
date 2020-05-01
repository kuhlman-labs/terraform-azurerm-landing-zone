## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| delegations | A List of delegation blocks to associate with the subnet. | `list` | `[]` | no |
| enforce\_private\_link\_endpoint\_network\_policies | (Optional) Enable or Disable network policies for the private link endpoint on the subnet. Default value is false. Conflicts with enforce\_private\_link\_service\_network\_policies. | `bool` | n/a | yes |
| enforce\_private\_link\_service\_network\_policies | (Optional) Enable or Disable network policies for the private link service on the subnet. Default valule is false. Conflicts with enforce\_private\_link\_endpoint\_network\_policies. | `bool` | n/a | yes |
| name\_prefix | The name of the subnet. Changing this forces a new resource to be created. | `string` | `"snet"` | no |
| resource\_group | resource Group of vNet | `string` | n/a | yes |
| subnet\_address\_prefix | The address prefix to use for the subnet. | `string` | n/a | yes |
| subnet\_service\_endpoints | The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql and Microsoft.Storage. | `list` | n/a | yes |
| vnet\_name | The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| name\_prefix | n/a |
| subnet\_address\_prefix | n/a |
| subnet\_id | n/a |
| subnet\_resource\_group\_name | n/a |
| subnet\_virtual\_network\_name | n/a |

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_capabilities | (Optional) A additional\_capabilities block as defined below. | `list` | `[]` | no |
| additional\_unattend\_content | (Optional) One or more additional\_unattend\_content blocks as defined below. Changing this forces a new resource to be created. | `list` | `[]` | no |
| admin\_password | (Required) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created. | `string` | n/a | yes |
| admin\_username | (Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created. | `string` | n/a | yes |
| allow\_extension\_operations | (Optional) Should Extension Operations be allowed on this Virtual Machine? Changing this forces a new resource to be created. | `bool` | `null` | no |
| availability\_set\_id | (Optional) Specifies the ID of the Availability Set in which the Virtual Machine should exist. Changing this forces a new resource to be created. | `string` | `null` | no |
| computer\_name | (Optional) Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer\_name, then you must specify computer\_name. Changing this forces a new resource to be created. | `string` | `null` | no |
| custom\_data | (Optional) The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created. | `string` | `null` | no |
| dedicated\_host\_id | (Optional) The ID of a Dedicated Host where this machine should be run on. Changing this forces a new resource to be created. | `string` | `null` | no |
| enable\_automatic\_updates | (Optional) Specifies if Automatic Updates are Enabled for the Windows Virtual Machine. Changing this forces a new resource to be created. | `bool` | `null` | no |
| enable\_zone | n/a | `bool` | `false` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| eviction\_policy | (Optional) Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. At this time the only supported value is Deallocate. Changing this forces a new resource to be created. | `string` | `null` | no |
| identity | (Optional) An identity block as defined below. | `list` | `[]` | no |
| license\_type | (Optional) Specifies the type of on-premise license (also known as Azure Hybrid Use Benefit) which should be used for this Virtual Machine. Possible values are None, Windows\_Client and Windows\_Server. Changing this forces a new resource to be created. | `string` | `null` | no |
| max\_bid\_price | (Optional) The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction\_policy. Defaults to -1, which means that the Virtual Machine should not be evicted for price reasons. | `number` | `null` | no |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"wvm"` | no |
| network\_interface\_ids | (Required). A list of Network Interface ID's which should be attached to this Virtual Machine. The first Network Interface ID in this list will be the Primary Network Interface on the Virtual Machine. | `list` | n/a | yes |
| os\_disk\_caching | (Required) The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite. | `string` | n/a | yes |
| os\_disk\_encryption\_set\_id | (Optional) The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk. | `string` | `null` | no |
| os\_disk\_size\_gb | (Optional) The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from. | `number` | `null` | no |
| os\_disk\_storage\_account\_type | (Required) The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard\_LRS, StandardSSD\_LRS and Premium\_LRS. Changing this forces a new resource to be created. | `string` | n/a | yes |
| os\_disk\_write\_accelerator\_enabled | (Optional) Should Write Accelerator be Enabled for this OS Disk? Defaults to false. | `bool` | `null` | no |
| plan | (Optional) A plan block as defined below. Changing this forces a new resource to be created. | `list` | `[]` | no |
| priority | (Optional) Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created. | `string` | `null` | no |
| provision\_vm\_agent | (Optional) Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created. | `bool` | `null` | no |
| proximity\_placement\_group\_id | (Optional) The ID of the Proximity Placement Group which the Virtual Machine should be assigned to. Changing this forces a new resource to be created. | `string` | `null` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| secret | (Optional) One or more secret blocks as defined below. | `list` | `[]` | no |
| size | (Required) The SKU which should be used for this Virtual Machine, such as Standard\_F2. | `string` | n/a | yes |
| source\_image\_id | (Optional) The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created. | `string` | `null` | no |
| source\_image\_reference\_offer | offer type, ex. WindowsServer | `string` | n/a | yes |
| source\_image\_reference\_publisher | publisher type, ex. MicrosoftWindowsServer | `string` | n/a | yes |
| source\_image\_reference\_sku | sku type, ex. 2016-Datacenter | `string` | n/a | yes |
| source\_image\_reference\_version | version type, ex. latest | `string` | n/a | yes |
| storage\_account\_uri | (Required) The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor. | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |
| timezone | (Optional) Specifies the Time Zone which should be used by the Virtual Machine, the possible values are defined here. | `string` | `null` | no |
| vm\_count | (Optional) number of VMs to create | `number` | `1` | no |
| winrm\_listener | (Optional) One or more winrm\_listener blocks as defined below. | `list` | `[]` | no |
| zone | (Optional) The Zone in which this Virtual Machine should be created. Changing this forces a new resource to be created. | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Windows Virtual Machine. |
| name | The Name of the Windows Virtual Machine. |


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_option | (Required) The method to use when creating the managed disk. Changing this forces a new resource to be created.Possible values include:Import,Empty,Copy,FromImage,Restore | `string` | n/a | yes |
| disk\_count | (Optional) number of VMs to create | `number` | `1` | no |
| disk\_encryption\_set\_id | (Optional) The ID of a Disk Encryption Set which should be used to encrypt this Managed Disk. Changing this forces a new resource to be created. | `string` | `null` | no |
| disk\_iops\_read\_write | (Optional) The number of IOPS allowed for this disk; only settable for UltraSSD disks. One operation can transfer between 4k and 256k bytes. | `string` | `null` | no |
| disk\_size\_gb | (Optional, Required for a new managed disk) Specifies the size of the managed disk to create in gigabytes. If create\_option is Copy or FromImage, then the value must be equal to or greater than the source's size. | `string` | `null` | no |
| enable\_zones | (Optional) Enable zone deployment for this Virtual Machine. | `bool` | `false` | no |
| encryption\_settings | (Optional) A encryption\_settings block as defined below. | `list` | `[]` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| image\_reference\_id | (Optional) ID of an existing platform/marketplace disk image to copy when create\_option is FromImage. | `string` | `null` | no |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"disk"` | no |
| os\_type | (Optional) Specify a value when the source of an Import or Copy operation targets a source that contains an operating system. Valid values are Linux or Windows. | `string` | `null` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| source\_resource\_id | (Optional) The ID of an existing Managed Disk to copy create\_option is Copy or the recovery point to restore when create\_option is Restore | `string` | `null` | no |
| source\_uri | (Optional) URI to a valid VHD file to be used when create\_option is Import. | `string` | `null` | no |
| storage\_account\_id | (Optional) The ID of the Storage Account where the source\_uri is located. Required when create\_option is set to Import. Changing this forces a new resource to be created. | `string` | `null` | no |
| storage\_account\_type | (Required) The type of storage to use for the managed disk. Possible values are Standard\_LRS, Premium\_LRS, StandardSSD\_LRS or UltraSSD\_LRS. | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |
| zones | (Optional) A collection containing the availability zone to allocate the Managed Disk in. | `list` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Managed Disk. |


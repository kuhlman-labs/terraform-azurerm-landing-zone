## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| caching | (Required) Specifies the caching requirements for this Data Disk. Possible values include None, ReadOnly and ReadWrite. | `string` | n/a | yes |
| create\_option | (Optional) The Create Option of the Data Disk, such as Empty or Attach. Defaults to Attach. Changing this forces a new resource to be created. | `string` | `null` | no |
| lun | (Required) The Logical Unit Number of the Data Disk, which needs to be unique within the Virtual Machine. Changing this forces a new resource to be created. | `string` | n/a | yes |
| managed\_disk\_id | (Required) The ID of an existing Managed Disk which should be attached. Changing this forces a new resource to be created. | `string` | n/a | yes |
| virtual\_machine\_id | (Required) The ID of the Virtual Machine to which the Data Disk should be attached. Changing this forces a new resource to be created. | `string` | n/a | yes |
| write\_accelerator\_enabled | (Optional) Specifies if Write Accelerator is enabled on the disk. This can only be enabled on Premium\_LRS managed disks with no caching and M-Series VMs. Defaults to false. | `bool` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Virtual Machine Data Disk attachment. |


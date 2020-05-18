## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_tier | (Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created. | `string` | n/a | yes |
| account\_kind | (Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to StorageV2. | `string` | `null` | no |
| account\_replication\_type | (Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS. | `string` | n/a | yes |
| account\_tier | (Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created. | `string` | n/a | yes |
| blob\_properties | (Optional) A blob\_properties block as defined below. | `list` | `[]` | no |
| custom\_domain | (Optional) A custom\_domain block as documented below. | `list` | `[]` | no |
| enable\_https\_traffic\_only | (Optional) Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true. | `bool` | `null` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| identity | (Optional) A identity block as defined below. | `list` | `[]` | no |
| is\_hns\_enabled | (Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 (see here for more information). Changing this forces a new resource to be created. | `bool` | `null` | no |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"st"` | no |
| network\_rules | (Optional) A network\_rules block as documented below. | `list` | `[]` | no |
| queue\_properties | (Optional) A queue\_properties block as defined below. | `list` | `[]` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| static\_website | (Optional) A static\_website block as defined below. | `list` | `[]` | no |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The storage account Resource ID. |
| primary\_blob\_endpoint | The endpoint URL for blob storage in the primary location. |


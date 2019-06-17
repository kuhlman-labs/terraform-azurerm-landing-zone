# **Infrastructure Modules: Storage Account**

# Description

This module deploys an Azure Storage Account and Resource Group.

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Storage Account | [storage/storage-account](../../resource-modules/storage/storage-account/README.md)|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_prefix | Prefix that will be used as initial part of the name for resource group and storage account, must be compatible with storage account naming, i.e. lowercase letters/numbers, no special characters | string | `"stor"` | no |
| region | Geographic region resource will be deployed into | string | n/a | yes |
| environment | Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab | string | n/a | yes |
| stor\_name | Name of the storage account to create. Will be added the resource_prefix. must be lowercase letters/numbers, no special characters maximum of 24 characters for prefix + name | string | n/a | yes |
| stor\_kind | Type of storage to use, valid inputs include Storage, StorageV2, BlobStorage | string | `"StorageV2"` | no |
| stor\_tier | Tier of storage to use, valid inputs include Standard, Premium | string | `"Standard"` | no |
| stor\_blob\_encryption | Enable/disable encryption for blob storage | string | `"true"` | no |
| stor\_file\_encryption | Enable/disable encryption for file storage | string | `"true"` | no |
| stor\_replication | Replication type to use, valid inputs include LRS, GRS, RAGRS, ZRS | string | `"LRS"` | no |
| access\_tier | Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool. | string | `"Hot"` | no |
| owner\_tag | APP/Technical; Email address of App/Product Owner | string | n/a | yes |
| region\_tag | Financial; i.e. Sharepoint Global | string | n/a | yes |
| cost\_center\_tag | Financial; Unique - Code provided directly from Finance (BU/Brand) | string | n/a | yes |
| approver\_tag | Financial; Unique - email address | string | n/a | yes |
| service\_hours\_tag | Automation/Security; Sort -FullTime\|Weekdays... | string | n/a | yes |

| optional\_tags | Optional tags to be added to resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| storage\_account\_id | Storage account resource id |
| storage\_account\_name | Generated storage account name |


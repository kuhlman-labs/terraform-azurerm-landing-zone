# **Solution: shared-services**

## Description

This solution creates a hub network, a Key Vault for VPN certificate storage, a Storage Account for centralized log persistence, and a Log Analytics Workspace for centralized analysis of logs.

**Note:** The solution takes in a pfx certificate for the configuration of the Key Vault certificate. The certificate in this repository should be replaced with a valid certificate for the destination of the CLZ.

## Resources

### Infrastructure Modules

Solutions are built by calling infrastructure modules that compose the lower level resource modules into a useable and repeatable portion of the infrastructure. Below are the listed infrastructure modules and the resources that are created as a result of their application.

| Type     | Module     |
|----------|------------|
| Hub Network | [network-hub](../../infrastructure-modules/network-hub) |
| Log Analytics | [log-analytics](../../infrastructure-modules/log-analytics) |
| Key Vault with P2S Certificate | [key-vault-with-p2s-cert](../../infrastructure-modules/key-vault-with-p2s-cert) |
| Storage Account | [storage-account](../../infrastructure-modules/storage-account) |

### Resources Created

| Type     | Resource Module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Virtual Network | [network/vnet](../../resource-modules/network/vnet/README.md)|
| Subnets| [network/vnet-subnets](../../resource-modules/network/vnet-subnets/README.md) |
| Network Security Groups | [network/nsg](../../resource-modules/network/nsg/README.md) |
| Virtual Network Gateway | [network/vnet-gateway](../../resource-modules/network/vnet-gateway/README.md)|
| Key Vault | [network/vnet](../../resource-modules/governance/key-vault/README.md)|
| P2S Certificate | [governance/key-vault-p2s-certificate](../../resource-modules/governance/key-vault-p2s-certificate/README.md) |
| Storage Account | [storage/storage-account](../../resource-modules/storage/storage-account/README.md)|
| Log Analytics Workspace | [governance/log-analytics](../../resource-modules/governance/log-analytics/README.md)|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| subscription\_id | The Id of the Subscription that should contain the created resources | string | n/a | yes |
| app\_id | The client ID for the Service Principal | string | n/a | yes |
| client\_secret | The secret for the Service Principal authentication | string | n/a | yes |
| tenant\_id | The tenant ID for the Service Principal | string | n/a | yes |
| environment | Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab | string | n/a | yes |
| region | Geographic region resource will be deployed into | string | n/a | yes |
| vnet\_address\_ranges | This is a list of the ip address ranges for the vnet | list | n/a | yes |
| subnets\_hub | Map of subnets with name, subnet_cidr, and service_endpoints. | list | n/a | yes |
| nsg\_rules | List of NSG rules | list | n/a | yes |
| client\_address\_spaces | The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation | list | n/a | yes |
| vpn\_client\_protocols | List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN. | list | n/a | yes |
| diag\_acc\_prefix | Prefix to be used for the shared services diagnostic storage account name. Must be compatible with Azure storage account naming, only lowercase letters and numbers | string | `"sshubinfdiag"` | no |
| diag\_kind | Type of storage to use, valid inputs include Storage, StorageV2, BlobStorage | string | `"StorageV2"` | no |
| diag\_tier | Tier of storage to use, valid inputs include Standard, Premium | string | `"Standard"` | no |
| diag\_blob\_encryption | Enable/disable encryption for blob storage | string | `"true"` | no |
| diag\_file\_encryption | Enable/disable encryption for file storage | string | `"true"` | no |
| diag\_replication | Replication type to use, valid inputs include LRS, GRS, RAGRS, ZRS | string | `"LRS"` | no |
| diag\_access\_tier | Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool. | string | `"Hot"` | no |
| owner\_tag | APP/Technical; Email address of App/Product Owner | string | n/a | yes |
| region\_tag | Financial; i.e. Sharepoint Global | string | n/a | yes |
| cost\_center\_tag | Financial; Unique - Code provided directly from Finance (BU/Brand) | string | n/a | yes |
| approver\_tag | Financial; Unique - email address | string | n/a | yes |
| service\_hours\_tag | Automation/Security; Sort -FullTime\|Weekdays... | string | n/a | yes |

| optional\_tags | A map of tags to add to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| shared\_vnet\_hub\_name | Generated name of the hub virtual network |
| shared\_vnet\_hub\_id | Resource id of the hub virtual network |
| shared\_vnet\_hub\_rg | Generated name of the resource group for hub virtual network |
| diag\_stor\_id | Resource id of the diagnostic storage account |
| diag\_stor\_name | Generated name for the diagnostic storage account |


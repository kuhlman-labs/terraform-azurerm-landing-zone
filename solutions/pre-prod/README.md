# **Solution: pre-prod**

## Description

This solution creates a spoke network, targeted at pre-production workloads, that is peered back to the hub network in the shared-services solution. The network is deployed with default Subnets with attached Network Security Groups.

**Note:** The shared-services solution must be deployed before this solution can be deployed, otherwise, the peering will fail because the hub network will not be present.

## Resources

### Infrastructure Modules

Solutions are built by calling infrastructure modules that compose the lower level resource modules into a useable and repeatable portion of the infrastructure. Below are the listed infrastructure modules and the resources that are created as a result of their application.

| Type     | Module     |
|----------|------------|
| Spoke Network | [network-spoke](../../infrastructure-modules/network-spoke) |

### Resources Created

| Type     | Resource Module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Virtual Network | [network/vnet](../../resource-modules/network/vnet/README.md)|
| Subnets| [network/vnet-subnets](../../resource-modules/network/vnet-subnets/README.md) |
| Network Security Groups | [network/nsg](../../resource-modules/network/nsg/README.md) |
| VNet Peering | [network/vnet-peering](../../resource-modules/network/vnet-peering/README.md) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| subscription\_id | The Id of the Subscription that should contain the created resources | string | n/a | yes |
| app\_id | The client ID for the Service Principal | string | n/a | yes |
| client\_secret | The secret for the Service Principal authentication | string | n/a | yes |
| tenant\_id | The tenant ID for the Service Principal | string | n/a | yes |
| access\_key | access key for the storage account that contains the Remote Backend | string | n/a | yes |
| storage\_account\_name | Storage account that contains Remote Backend, e.g. terraformdata24321 | string | n/a | yes |
| environment | Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab | string | n/a | yes |
| state\_key | Key for the state file of the solution, e.g. pre-prod.tfstate | string | n/a | yes |
| region | Geographic region resource will be deployed into | string | n/a | yes |
| vnet\_address\_ranges | This is a list of the ip address ranges for the vnet | list | n/a | yes |
| subnets\_spoke | Map of subnets with name, subnet_cidr, and service_endpoints. | list | n/a | yes |
| nsg\_rules | List of NSG rules | list | n/a | yes |
| owner\_tag | APP/Technical; Email address of App/Product Owner | string | n/a | yes |
| region\_tag | Financial; i.e. Sharepoint Global | string | n/a | yes |
| cost\_center\_tag | Financial; Unique - Code provided directly from Finance (BU/Brand) | string | n/a | yes |
| approver\_tag | Financial; Unique - email address | string | n/a | yes |
| service\_hours\_tag | Automation/Security; Sort -FullTime\|Weekdays... | string | n/a | yes |

| optional\_tags | A map of tags to add to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| pre\_prod\_vnet\_spoke\_name | Generated name of the Virtual Network |
| pre\_prod\_vnet\_spoke\_rg | Generated name of the Virtual Network resource group |


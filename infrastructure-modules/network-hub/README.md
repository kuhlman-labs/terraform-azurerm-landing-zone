# **Infrastructure Modules: Hub Network**

## Description

This TF module creates a Virtual Network for use as a the Hub in a Hub and Spoke network.  

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Virtual Network | [network/vnet](../../resource-modules/network/vnet/README.md)|
| Subnets| [network/vnet-subnets](../../resource-modules/network/vnet-subnets/README.md) |
| Network Security Group | [network/nsg](../../resource-modules/network/nsg/README.md) |
| VNet Gateway | [network/vnet-gateway](../../resource-modules/network/vnet-gateway/README.md)|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| vnet\_address\_ranges | This is a list of the ip address ranges for the vnet | list | n/a | yes |
| tier | The tier of a VNet, e.g HUB, or SPK | string | `"hub"` | no |
| subnets\_hub | Map of subnets with name, subnet_cidr, and service_endpoints. | list | n/a | yes |
| nsg\_rules\_dmz | List of NSG rules | list | n/a | yes |
| certificate\_data | Certificate Information generated from Key Vault that the vNet gateway will use for the P2S connections | string | `""` | no |
| client\_address\_spaces | The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation | list | n/a | yes |
| vpn\_client\_protocols | List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN. | list | n/a | yes |
| region | Geographic Region resource will be deployed into | string | n/a | yes |
| environment | Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab | string | n/a | yes |
| owner\_tag | APP/Technical; Email address of App/Product Owner | string | n/a | yes |
| region\_tag | Financial; i.e. Sharepoint Global | string | n/a | yes |
| cost\_center\_tag | Financial; Unique - Code provided directly from Finance (BU/Brand) | string | n/a | yes |
| approver\_tag | Financial; Unique - email address | string | n/a | yes |
| service\_hours\_tag | Automation/Security; Sort -FullTime\|Weekdays... | string | n/a | yes |
| cloudreach\_ops\_tag | Automation/Security; Reserved for Cloudreach Ops | string | n/a | yes |
| optional\_tags | A map of tags to add to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_hub\_name | Generated hub vnet name |
| vnet\_hub\_id | Resource id of hub vnet |
| vnet\_hub\_rg | Generated hub resource group name |
| vnet\_subnets\_hub\_id | List of hub subnets resource ids |
| vnet\_subnets\_hub\_name | List of hub subnet names |
| vnet\_gateway\_hub\_id | Virtual network gateway resource id |
| vnet\_subnets\_hub\_dmz\_nsg | DMZ network security group resource id |


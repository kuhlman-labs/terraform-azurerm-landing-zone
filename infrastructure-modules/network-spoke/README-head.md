# **Infrastructure Modules: Spoke Network**

## Description

This TF module creates a Virtual Network for use as a Spoke in a Hub and Spoke network.

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Virtual Network | [network/vnet](../../resource-modules/network/vnet/README.md)|
| Subnets| [network/vnet-subnets](../../resource-modules/network/vnet-subnets/README.md) |
| Network Security Group | [network/nsg](../../resource-modules/network/nsg/README.md) |
| VNet Peering | [network/vnet-peering](../../resource-modules/network/vnet-peering/README.md) |


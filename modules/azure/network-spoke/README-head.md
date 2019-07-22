# **Infrastructure Modules: Spoke Network**

## Description

This TF module creates a Virtual Network for use as a Spoke in a Hub and Spoke network.

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../../resources/azure/resource-group/README.md)|
| Virtual Network | [network/vnet](../../../resources/azure/network/vnet/README.md)|
| Subnets| [network/vnet-subnets](../../../resources/azure/network/vnet-subnets/README.md) |
| Network Security Group | [network/nsg](../../../resources/azure/network/nsg/README.md) |
| VNet Peering | [network/vnet-peering](../../../resources/azure/network/vnet-peering/README.md) |


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


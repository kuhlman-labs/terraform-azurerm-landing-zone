# **Solution: shared-services**

## Description

This solution creates a hub network, a Key Vault for VPN certificate storage, a Storage Account for centralized log persistence, and a Log Analytics Workspace for centralized analysis of logs.

**Note:** The solution takes in a pfx certificate for the configuration of the Key Vault certificate. The certificate in this repository should be replaced with a valid certificate for the destination of the Landing Zone.

## Resources

### Infrastructure Modules

Solutions are built by calling infrastructure modules that compose the lower level resource modules into a useable and repeatable portion of the infrastructure. Below are the listed infrastructure modules and the resources that are created as a result of their application.

| Type     | Module     |
|----------|------------|
| Hub Network | [network-hub](../../modules/azure/network-hub) |
| Log Analytics | [log-analytics](../../modules/azure/log-analytics) |
| Key Vault with P2S Certificate | [key-vault-with-p2s-cert](../../modules/azure/key-vault-with-p2s-cert) |
| Storage Account | [storage-account](../../modules/azure/storage-account) |

### Resources Created

| Type     | Resource Module     |
|----------|------------|
| Resource Group | [resource-group](../../resources/azure/resource-group/README.md)|
| Virtual Network | [network/vnet](../../resources/azure/network/vnet/README.md)|
| Subnets| [network/vnet-subnets](../../resources/azure/network/vnet-subnets/README.md) |
| Network Security Groups | [network/nsg](../../resources/azure/network/nsg/README.md) |
| Virtual Network Gateway | [network/vnet-gateway](../../resources/azure/network/vnet-gateway/README.md)|
| Key Vault | [network/vnet](../../resources/azure/governance/key-vault/README.md)|
| P2S Certificate | [governance/key-vault-p2s-certificate](../../resources/azure/governance/key-vault-p2s-certificate/README.md) |
| Storage Account | [storage/storage-account](../../resources/azure/storage/storage-account/README.md)|
| Log Analytics Workspace | [governance/log-analytics](../../resources/azure/governance/log-analytics/README.md)|


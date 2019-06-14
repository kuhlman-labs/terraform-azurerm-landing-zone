# **Infrastructure Modules: Key Vault with P2S Certificate**

## Description

This TF module creates a Resource Group containing Key Vault and supporting certificate for a P2S VPN configuration.  

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Key Vault | [network/vnet](../../resource-modules/governance/key-vault/README.md)|
| P2S Certificate | [governance/key-vault-p2s-certificate](../../resource-modules/governance/key-vault-p2s-certificate/README.md) |



# **Infrastructure Modules: Key Vault with P2S Certificate**

## Description

This TF module creates a Resource Group containing Key Vault and supporting certificate for a P2S VPN configuration.  

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Key Vault | [network/vnet](../../resource-modules/governance/key-vault/README.md)|
| P2S Certificate | [governance/key-vault-p2s-certificate](../../resource-modules/governance/key-vault-p2s-certificate/README.md) |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | Geographic region resource will be deployed into | string | n/a | yes |
| environment | Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab | string | n/a | yes |
| tenant\_id | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. | string | n/a | yes |
| object\_id | The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. | string | n/a | yes |
| certificate\_contents | The base64-encoded certificate contents. Changing this forces a new resource to be created. | string | n/a | yes |
| certificate\_password | The password associated with the certificate. Changing this forces a new resource to be created. | string | n/a | yes |
| owner\_tag | APP/Technical; Email address of App/Product Owner | string | n/a | yes |
| region\_tag | Financial; i.e. Sharepoint Global | string | n/a | yes |
| cost\_center\_tag | Financial; Unique - Code provided directly from Finance (BU/Brand) | string | n/a | yes |
| approver\_tag | Financial; Unique - email address | string | n/a | yes |
| service\_hours\_tag | Automation/Security; Sort -FullTime\|Weekdays... | string | n/a | yes |

| optional\_tags | Optional tags to be added to resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_vault\_id | Key Vault resource id |
| key\_vault\_p2s\_certificate\_data | Raw Key Vault Certificate |


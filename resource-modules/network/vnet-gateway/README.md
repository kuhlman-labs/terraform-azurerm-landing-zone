# **Resource Modules: Virtual Network Gateway**

## Description

This TF module can be used to create a Virtual Network Gateway that has an associated public Ip address and takes in a certificate for configuring a Point-to-Site connection.

## Resources Created

- Virtual Network Gateway
- Public IP Address

## Example Variables
```javascript

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_group | Resource Group that vNet Gateway will deploy into, must be same as the vNet's resource gorup | string | n/a | yes |
| resource\_prefix | a short pre-defined text to identify resource type | string | `"vnetgw"` | no |
| region | Geographic region resource will be deployed into | string | n/a | yes |
| environment | Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab | string | n/a | yes |
| gateway\_subnet | The GateWay subnet id that the VPN gateway will use | string | `""` | no |
| certificate\_data | Certificate Information generated from Key Vault that the vNet gateway will use for the P2S connections | string | `""` | no |
| ip\_allocation | Allocation method for Public IP Address; Can beStatic or Dynamic | string | `"Dynamic"` | no |
| gateway\_type | Virtual Network Gateway Type; Can be VPN or ExpressRoute | string | `"VPN"` | no |
| vpn\_type | The routing type of the Virtual Network Gateway; Can be RouteBased or PolicyBased. | string | `"RouteBased"` | no |
| sku | Configuration of the size and capacity of the virtual network gateway; Can be are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw1AZ, VpnGw2AZ, and VpnGw3AZ and depend on the type and vpn_type arguments. A PolicyBased gateway only supports the Basic sku. Further, the UltraPerformance sku is only supported by an ExpressRoute gateway. | string | `"VpnGw1"` | no |
| client\_address\_spaces | The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation | list | n/a | yes |
| vpn\_client\_protocols | List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN. | list | n/a | yes |
| owner\_tag | APP/Technical; Email address of App/Product Owner | string | n/a | yes |
| region\_tag | Financial; i.e. Sharepoint Global | string | n/a | yes |
| cost\_center\_tag | Financial; Unique - Code provided directly from Finance (BU/Brand) | string | n/a | yes |
| approver\_tag | Financial; Unique - email address | string | n/a | yes |
| service\_hours\_tag | Automation/Security; Sort -FullTime\|Weekdays... | string | n/a | yes |

| optional\_tags | Optional tags to be added to resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_gateway\_id | Virtual network gateway resource id |


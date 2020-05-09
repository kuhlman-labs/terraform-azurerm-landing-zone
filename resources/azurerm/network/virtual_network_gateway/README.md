## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| active\_active | (Optional) If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `null` | no |
| address\_prefixes | (Required) The address prefixes to use for the vgw subnet. | `list` | n/a | yes |
| address\_space | (Required) The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation. | `list` | n/a | yes |
| default\_local\_network\_gateway\_id | (Optional) The ID of the local network gateway through which outbound Internet traffic from the virtual network in which the gateway is created will be routed (forced tunnelling). Refer to the Azure documentation on forced tunnelling. If not specified, forced tunnelling is disabled. | `string` | `null` | no |
| enable\_bgp | (Optional) If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `null` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| generation | (Optional) The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None. | `string` | `null` | no |
| name\_prefix | a short pre-defined text to identify resource type | `string` | `"vgw"` | no |
| private\_ip\_address\_allocation | (Optional) Defines how the private IP address of the gateways virtual interface is assigned. Valid options are Static or Dynamic. Defaults to Dynamic. | `string` | `null` | no |
| public\_cert\_data | (Required) The public certificate of the root certificate authority. The certificate must be provided in Base-64 encoded X.509 format (PEM). In particular, this argument must not include the -----BEGIN CERTIFICATE----- or -----END CERTIFICATE----- markers. | `string` | n/a | yes |
| public\_ip\_name | (Required) Name of the public ip associated with the vgw | `string` | n/a | yes |
| resource\_group | resource Group that vNet Gateway will deploy into, must be same as the vNet's resource gorup | `string` | n/a | yes |
| revoked\_certificate | (Optional) One or more revoked\_certificate blocks which are defined below. This setting is incompatible with the use of radius\_server\_address and radius\_server\_secret. | `list` | `[]` | no |
| root\_certificate\_name | (Required) A user-defined name of the root certificate. | `string` | n/a | yes |
| sku | (Required) Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn\_type and generation arguments. A PolicyBased gateway only supports the Basic sku. Further, the UltraPerformance sku is only supported by an ExpressRoute gateway. | `string` | n/a | yes |
| tags | Optional tags to be added to resource | `map` | `{}` | no |
| type | (Required) The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. Changing the type forces a new resource to be created. | `string` | n/a | yes |
| virtual\_network\_name | (Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created. | `string` | n/a | yes |
| vpn\_client\_protocols | (Optional) List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN. | `list` | `null` | no |
| vpn\_type | (Optional) The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Virtual Network Gateway. |


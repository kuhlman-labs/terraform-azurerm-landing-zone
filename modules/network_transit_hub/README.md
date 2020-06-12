## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefix\_fw | The address prefixe to use for the fw subnet. | `list` | n/a | yes |
| address\_prefix\_vgw | The address prefixe to use for the vgw subnet. | `list` | n/a | yes |
| address\_space | This is a list of the ip address ranges for the vnet | `list` | n/a | yes |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |
| vgw\_sku | (Optional) Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn\_type and generation arguments. A PolicyBased gateway only supports the Basic sku. Further, the UltraPerformance sku is only supported by an ExpressRoute gateway. | `string` | `"Basic"` | no |
| vgw\_type | (Optional) The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. Changing the type forces a new resource to be created. | `string` | `"Vpn"` | no |
| vpn\_address\_space | (Required) The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation. | `list` | <pre>[<br>  "192.168.100.0/24"<br>]</pre> | no |
| vpn\_client\_protocols | (Optional) List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN. | `list` | <pre>[<br>  "SSTP"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| firewall\_id | The Resource ID of the Azure Firewall. |
| firewall\_private\_ip\_address | The private IP address of the Azure Firewall. |
| virtual\_network\_gateway\_id | The ID of the Virtual Network Gateway. |
| virtual\_network\_id | The virtual NetworkConfiguration ID. |
| virtual\_network\_name | The name of the virtual network. |
| virtual\_network\_resource\_group\_name | The name of the resource group of the virtual network. |


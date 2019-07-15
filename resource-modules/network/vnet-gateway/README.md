
# Module `.`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `certificate_data` (required): Certificate Information generated from Key Vault that the vNet gateway will use for the P2S connections
* `client_address_spaces` (required): The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `gateway_subnet` (required): The GateWay subnet id that the VPN gateway will use
* `gateway_type` (default `"VPN"`): Virtual Network Gateway Type; Can be VPN or ExpressRoute
* `ip_allocation` (default `"Dynamic"`): Allocation method for Public IP Address; Can be Static or Dynamic
* `region` (required): Geographic region resource will be deployed into
* `resource_group` (required): Resource Group that vNet Gateway will deploy into, must be same as the vNet's resource gorup
* `resource_prefix` (default `"vnet-gw"`): a short pre-defined text to identify resource type
* `sku` (default `"Basic"`): Configuration of the size and capacity of the virtual network gateway; Can be are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw1AZ, VpnGw2AZ, and VpnGw3AZ and depend on the type and vpn_type arguments. A PolicyBased gateway only supports the Basic sku. Further, the UltraPerformance sku is only supported by an ExpressRoute gateway.
* `tags` (required): Optional tags to be added to resource
* `vpn_client_protocols` (required): List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN.
* `vpn_type` (default `"RouteBased"`): The routing type of the Virtual Network Gateway; Can be RouteBased or PolicyBased.

## Output Values
* `vnet_gateway_id`: Virtual network gateway resource id

## Managed Resources
* `azurerm_public_ip.base` from `azurerm`
* `azurerm_virtual_network_gateway.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


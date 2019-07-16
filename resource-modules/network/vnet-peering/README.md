
# Module `resource-modules/network/vnet-peering`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `allow_forwarded_traffic` (default `"true"`): Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to true.
* `allow_vnet_access` (default `"true"`): Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to true.
* `hub_allow_gateway_transit` (required): Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network.
* `hub_use_remote_gateways` (required): Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false.
* `hub_vnet_id` (required): This is the ID for the Hub Vnet
* `hub_vnet_name` (required): This is the Hub Vnet name
* `hub_vnet_rg` (required): This is the resource group name for the Hub Vnet
* `spoke_allow_gateway_transit` (required): Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network.
* `spoke_use_remote_gateways` (required): Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false.
* `spoke_vnet_id` (required): Spoke Vnets ID to be peered with the Hub Vnet
* `spoke_vnet_name` (required): Spoke Vnets Name to be peered with the Hub Vnet
* `spoke_vnet_rg` (required): Spoke Vnets Resource Group to be peered with the Hub Vnet

## Output Values
* `vnet_hub_to_spoke_peering_id`: Resource id for peering between hub and spoke vnet
* `vnet_spoke_to_hub_peering_id`: Resource id for peering between spoke and hub vnet

## Managed Resources
* `azurerm_virtual_network_peering.hub_to_spoke` from `azurerm`
* `azurerm_virtual_network_peering.spoke_to_hub` from `azurerm`


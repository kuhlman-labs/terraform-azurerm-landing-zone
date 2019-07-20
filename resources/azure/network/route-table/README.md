
# Module `resources/network/route-table`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `disable_bgp_route_propagation` (required): bool flag which controls propagation of routes learned by BGP on that route table. True means disable.
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"route-table"`): A short pre-defined text to identify the resource type
* `route_address_prefix` (required): The destination CIDR to which the route applies, such as 10.1.0.0/16
* `route_name` (required): The name of the route.
* `route_next_hop_in_ip_address` (required): Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance.
* `route_next_hop_type` (required): The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None.

## Output Values
* `route_table_id`
* `route_table_subnets`

## Managed Resources
* `azurerm_route_table.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


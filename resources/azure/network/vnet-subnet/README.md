
# Module `resources/azure/network/vnet-subnet`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `delegations` (required): A List of delegation blocks to associate with the subnet.
* `network_security_group_id` (required): The ID of the Network Security Group to associate with the subnet.
* `resource_group` (required): Resource Group of vNet
* `route_table_id` (required): The ID of the Route Table to associate with the subnet.
* `subnet_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_name` (required): The name of the subnet. Changing this forces a new resource to be created.
* `subnet_service_endpoints` (required): The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql and Microsoft.Storage.
* `vnet_name` (required): The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created.

## Output Values
* `subnet_address_prefix`
* `subnet_id`
* `subnet_ip_configurations`
* `subnet_name`
* `subnet_resource_group_name`
* `subnet_virtual_network_name`

## Managed Resources
* `azurerm_subnet.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


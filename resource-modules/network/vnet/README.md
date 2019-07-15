
# Module `resource-modules/network/vnet/`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"vnet"`): A short pre-defined text to identify the resource type
* `tags` (required): A map of tags to add to all resources
* `vnet_address_ranges` (required): This is a list of the ip address ranges for the vnet

## Output Values
* `vnet_id`: vnet resource id
* `vnet_name`: Generated vnet name
* `vnet_rg_id`: Vnet owning resource group id
* `vnet_rg_name`: Generated vnet resource group name

## Managed Resources
* `azurerm_virtual_network.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`



# Module `.`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `route_table_id` (required): The ID of the Route Table which should be associated with the Subnet. Changing this forces a new resource to be created.
* `subnet_id` (required): The ID of the Subnet. Changing this forces a new resource to be created.

## Output Values
* `route_association_id`

## Managed Resources
* `azurerm_subnet_route_table_association.base` from `azurerm`



# Module `resources/azure/network/nsg-association`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** `~> 1.32.0`

## Input Variables
* `network_security_group_id` (required): Subnet names the NSG will apply to. Used for count
* `subnet_id` (required): Subnet the NSG will apply to

## Managed Resources
* `azurerm_subnet_network_security_group_association.base` from `azurerm`



# Module `resources/azure/network/firewall`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** `~> 1.32.0`

## Input Variables
* `public_ip_address_id` (required): (Optional) The ID of a Public IP Address which the Firewall should use.
* `resource_group` (required): The name of the target resource group
* `name_prefix` (default `"firewall"`): Specifies the name of the Firewall. Changing this forces a new resource to be created.
* `subnet_id` (required): Reference to the subnet associated with the IP Configuration.
* `tags` (required): Optional tags to be added to resource

## Output Values
* `firewall_id`
* `firewall_private_ip`

## Managed Resources
* `azurerm_firewall.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


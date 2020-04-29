
# Module `resources/azure/network/firewall-network-rule-collection`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** `~> 1.32.0`

## Input Variables
* `azure_firewall_name` (required): (Required) Specifies the name of the Firewall in which the Network Rule Collection should be created. Changing this forces a new resource to be created.
* `collection_action` (required): Specifies the action the rule will apply to matching traffic. Possible values are Allow and Deny.
* `collection_priority` (required): Specifies the priority of the rule collection. Possible values are between 100 - 65000.
* `resource_group` (required): The name of the target resource group
* `name_prefix` (default `"firewall-network-rule-collection"`): Specifies the name of the Firewall. Changing this forces a new resource to be created.
* `rule` (required)
* `tags` (required): Optional tags to be added to resource

## Managed Resources
* `azurerm_firewall_network_rule_collection.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`



# Module `.`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `firewall_collection_action` (required): Specifies the action the rule will apply to matching traffic. Possible values are Allow and Deny.
* `firewall_collection_priority` (required): Specifies the priority of the rule collection. Possible values are between 100 - 65000.
* `firewall_rule_destination_addresses` (required): A list of destination IP addresses and/or IP ranges.
* `firewall_rule_destination_ports` (required): A list of destination ports.
* `firewall_rule_name` (required): Specifies the name of the rule.
* `firewall_rule_protocols` (required): A list of protocols. Possible values are Any, ICMP, TCP and UDP.
* `firewall_rule_source_addresses` (required): A list of source IP addresses and/or IP ranges.
* `firewall_subnet_id` (required): Reference to the subnet associated with the IP Configuration.
* `region` (required): Geographic region resource will be deployed into
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"firewall"`): Specifies the name of the Firewall. Changing this forces a new resource to be created.
* `tags` (required): Optional tags to be added to resource

## Output Values
* `firewall_id`
* `firewall_private_ip`
* `firewall_public_ip`

## Managed Resources
* `azurerm_firewall.base` from `azurerm`
* `azurerm_firewall_network_rule_collection.base` from `azurerm`
* `azurerm_public_ip.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


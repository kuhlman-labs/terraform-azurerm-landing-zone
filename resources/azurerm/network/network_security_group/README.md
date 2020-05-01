
# Module `resources/azure/network/nsg`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** `~> 1.32.0`

## Input Variables
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `nsg_rules` (default `[{"access":"Allow","destination_address_prefix":"*","destination_port_range":"22","direction":"Inbound","name":"SSH","priority":100,"protocol":"*","source_address_prefix":"VirtualNetwork","source_port_range":"22"},{"access":"Allow","destination_address_prefix":"*","destination_port_range":"3389","direction":"Inbound","name":"RDP","priority":110,"protocol":"*","source_address_prefix":"VirtualNetwork","source_port_range":"3389"}]`): List of NSG rules
* `resource_group` (required): This is the resource group to which the resources will be deployed
* `name_prefix` (default `"nsg"`): A short pre-defined text to identify the resource type
* `name_prefixs` (required): Subnet names the NSG will apply to. Used for count

## Output Values
* `nsg_id`: Network security group resource id
* `nsg_rules_ids`: List of network security group rules ids

## Managed Resources
* `azurerm_network_security_group.base` from `azurerm`
* `azurerm_network_security_rule.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


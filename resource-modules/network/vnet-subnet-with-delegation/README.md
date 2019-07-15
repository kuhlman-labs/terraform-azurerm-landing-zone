
# Module `resource-modules/network/vnet-subnet-with-delegation/`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `delegation_name` (required): A name for this delegation.
* `resource_group` (required): Resource Group of vNet
* `service_delegation_actions` (required): A list of Actions which should be delegated. Possible values include: Microsoft.Network/virtualNetworks/subnets/action.
* `service_delegation_name` (required): The name of service to delegate to. Possible values include: Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Logic/integrationServiceEnvironments, Microsoft.Netapp/volumes, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers or Microsoft.Web/serverFarms.
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


# Module `infrastructure-modules/network-spoke/`

Provider Requirements:
* **terraform:** (any version)

## Input Variables
* `access_key` (required): access key for the storage account that contains the Remote Backend
* `allow_forwarded_traffic` (default `"true"`): Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to true.
* `container_name` (required): Storage account container that contains Remote Backend, e.g. tfstate
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `hub_allow_gateway_transit` (required): Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network.
* `hub_use_remote_gateways` (required): Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false.
* `region` (required): Geographic region resource will be deployed into
* `route_address_prefix` (required): The destination CIDR to which the route applies, such as 10.1.0.0/16
* `shared_state_key` (required): Key for the shared services State file, e.g. shared-services.tfstate
* `spoke_allow_gateway_transit` (required): Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network.
* `spoke_use_remote_gateways` (required): Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false.
* `storage_account_name` (required): Storage account that contains Remote Backend, e.g. terraformdata24321
* `subnet_aks_nodes_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_virtual_node_aci_address_prefix` (required): The address prefix to use for the subnet.
* `tags` (required): A map of tags to add to all resources
* `tier` (default `"spk"`): The tier of a VNet, e.g HUB, or SPK
* `vnet_address_ranges` (required): This is a list of the ip address ranges for the vnet

## Output Values
* `subnet_aks_nodes_id`
* `subnet_aks_nodes_name`
* `subnet_virtual_node_aci_id`
* `subnet_virtual_node_aci_name`
* `vnet_spoke_id`: Resource id of created spoke vnet
* `vnet_spoke_name`: Generated spoke vnet name
* `vnet_spoke_rg`: Generated spoke resource group name

## Data Resources
* `data.terraform_remote_state.shared_services` from `terraform`

## Child Modules
* `resource_group` from `../../resource-modules/resource-group`
* `route_table` from `../../resource-modules/network/route-table`
* `route_table_association_aks_nodes` from `../../resource-modules/network/route-table-association`
* `subnet_aks_nodes` from `../../resource-modules/network/vnet-subnet`
* `subnet_virtual_node_aci` from `../../resource-modules/network/vnet-subnet-with-delegation`
* `vnet_peering` from `../../resource-modules/network/vnet-peering`
* `vnet_spoke` from `../../resource-modules/network/vnet`
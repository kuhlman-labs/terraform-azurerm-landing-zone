# Module `infrastructure-modules/network-hub/`

## Input Variables
* `certificate_data` (required): Certificate Information generated from Key Vault that the vNet gateway will use for the P2S connections
* `client_address_spaces` (required): The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `nsg_rules_dmz` (required): List of NSG rules
* `region` (required): Geographic Region resource will be deployed into
* `subnet_app_gw_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_dmz_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_firewall_address_prefix` (required): The address prefix to use for the subnet.
* `subnet_gateway_address_prefix` (required): The address prefix to use for the subnet.
* `tags` (required): A map of tags to add to all resources
* `vnet_address_ranges` (required): This is a list of the ip address ranges for the vnet
* `vpn_client_protocols` (required): List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN.

## Output Values
* `appgw_id`
* `firewall_id`
* `firewall_private_ip`
* `firewall_public_ip`
* `gateway_id`: Virtual network gateway resource id
* `subnet_app_gw_id`
* `subnet_dmz_id`
* `subnet_dmz_name`
* `subnet_firewall_id`
* `subnet_gateway_id`
* `vnet_hub_id`: Resource id of hub vnet
* `vnet_hub_name`: Generated hub vnet name
* `vnet_hub_rg`: Generated hub resource group name

## Child Modules
* `app_gw_waf` from `../../resource-modules/network/application-gateway`
* `firewall` from `../../resource-modules/network/firewall`
* `nsg_association_dmz` from `../../resource-modules/network/nsg-association`
* `nsg_dmz` from `../../resource-modules/network/nsg`
* `resource_group` from `../../resource-modules/resource-group`
* `subnet_app_gw` from `../../resource-modules/network/vnet-subnet`
* `subnet_dmz` from `../../resource-modules/network/vnet-subnet`
* `subnet_firewall` from `../../resource-modules/network/vnet-subnet`
* `subnet_gateway` from `../../resource-modules/network/vnet-subnet`
* `vnet_gateway` from `../../resource-modules/network/vnet-gateway`
* `vnet_hub` from `../../resource-modules/network/vnet`

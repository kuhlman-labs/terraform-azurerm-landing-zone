
# Module `resource-modules/network/application-gateway/`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `appgw_sku` (required): The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2.
* `appgw_subnet_id` (required): The ID of a Subnet.
* `appgw_tier` (required): The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2.
* `appgw_vnet_name` (required): Name of the Vnet that the appgw is in
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"app-gw"`): Short prefix to identify resource
* `tags` (required): Optional tags to be added to resource

## Output Values
* `appgw_id`

## Managed Resources
* `azurerm_application_gateway.base` from `azurerm`
* `azurerm_public_ip.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


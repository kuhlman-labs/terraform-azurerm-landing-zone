
# Module `resource-modules/network/application-gateway`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `private_ip_address` (required): (Optional) The Private IP Address to use for the Application Gateway.
* `public_ip_address_id` (required): (Optional) The ID of a Public IP Address which the Application Gateway should use.
* `resource_group` (required): The name of the target resource group
* `resource_prefix` (default `"app-gw"`): Short prefix to identify resource
* `sku_capacity` (default `1`): (Required) The Capacity of the SKU to use for this Application Gateway - which must be between 1 and 10, optional if autoscale_configuration is set
* `sku_name` (required): The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2.
* `sku_tier` (required): The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2.
* `subnet_id` (required): The ID of a Subnet.
* `tags` (required): Optional tags to be added to resource
* `zones` (required): (Optional) A collection of availability zones to spread the Application Gateway over.

## Output Values
* `appgw_id`

## Managed Resources
* `azurerm_application_gateway.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


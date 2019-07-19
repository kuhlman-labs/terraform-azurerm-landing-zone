
# Module `resource-modules/network/public-ip`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `allocation_method` (required): (Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic.
* `domain_name_label` (required): (Optional) Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system.
* `idle_timeout_in_minutes` (required): (Optional) Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes.
* `ip_version` (required): (Optional) The IP Version to use, IPv6 or IPv4.
* `name` (required): (Required) Specifies the name of the Public IP resource . Changing this forces a new resource to be created.
* `public_ip_prefix_id` (required): (Optional) If specified then public IP address allocated will be provided from the public IP prefix resource.
* `resource_group` (required): The name of the target resource group
* `reverse_fqdn` (required): (Optional) A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN.
* `sku` (default `"Basic"`): (Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic.
* `tags` (required): Optional tags to be added to resource
* `zones` (required): (Optional) A collection containing the availability zone to allocate the Public IP in.

## Output Values
* `public_ip_address`: The IP address value that was allocated. Note Dynamic Public IP Addresses aren't allocated until they're attached to a device
* `public_ip_fqdn`: Fully qualified domain name of the A DNS record associated with the public IP. domain_name_label must be specified to get the fqdn. This is the concatenation of the domain_name_label and the regionalized DNS zone
* `public_ip_id`: The Public IP ID.

## Managed Resources
* `azurerm_public_ip.base` from `azurerm`

## Data Resources
* `data.azurerm_resource_group.base` from `azurerm`


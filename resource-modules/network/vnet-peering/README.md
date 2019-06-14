# **Resource Modules: VNet Peering**

## Description
This TF module can be used to create the virtual network peerings between a spoke network and the hub network in a hub and spoke networking model.

## Resources Created

- VNet Peering - Hub to Spoke
- VNet Peering - Spoke to Hub

## Example Variables
```javascript
  hub_vnet_name = "${module.vnet-hub.vnet_name}"
  hub_vnet_rg = "${module.vnet-hub.vnet_rg_name}"
  spoke_vnets_name = "${list("${module.vnet-spoke.vnet_name}")}"
  spoke_vnets_rg = "${list("${module.vnet-spoke.vnet_rg_name}")}"
  allow_forwarded_traffic = "true"
  hub_allow_gateway_transit = "true"
  hub_use_remote_gateways = "false"
  spoke_allow_gateway_transit = "true"
  spoke_use_remote_gateways = "false"
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| hub\_vnet\_rg | This is the resource group name for the Hub Vnet | string | n/a | yes |
| hub\_vnet\_id | This is the ID for the Hub Vnet | string | n/a | yes |
| hub\_vnet\_name | This is the Hub Vnet name | string | n/a | yes |
| spoke\_vnet\_rg | Spoke Vnets Resource Group to be peered with the Hub Vnet | string | n/a | yes |
| spoke\_vnet\_name | Spoke Vnets Name to be peered with the Hub Vnet | string | n/a | yes |
| spoke\_vnet\_id | Spoke Vnets ID to be peered with the Hub Vnet | string | n/a | yes |
| allow\_vnet\_access | Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to true. | string | `"true"` | no |
| allow\_forwarded\_traffic | Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to true. | string | `"true"` | no |
| hub\_allow\_gateway\_transit | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | string | n/a | yes |
| hub\_use\_remote\_gateways | Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false. | string | n/a | yes |
| spoke\_allow\_gateway\_transit | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | string | n/a | yes |
| spoke\_use\_remote\_gateways | Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_hub\_to\_spoke\_peering\_id | Resource id for peering between hub and spoke vnet |
| vnet\_spoke\_to\_hub\_peering\_id | Resource id for peering between spoke and hub vnet |


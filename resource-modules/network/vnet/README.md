# **Resource Modules: Virtual Network**

## Description

This TF module can be used to create a basic virtual network.

## Resources Created

- Virtual Network

## Example Variables
```javascript
    resource_prefix = "vnet"
    region = "eastus"

    vnet_address_ranges = ["10.1.0.0/16"]

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_group | The name of the target resource group | string | n/a | yes |
| vnet\_address\_ranges | This is a list of the ip address ranges for the vnet | list | n/a | yes |
| tier | The tier of a VNet, e.g HUB, or SPK | string | n/a | yes |
| owner\_tag | APP/Technical; Email address of App/Product Owner | string | n/a | yes |
| region\_tag | Financial; i.e. Sharepoint Global | string | n/a | yes |
| cost\_center\_tag | Financial; Unique - Code provided directly from Finance (BU/Brand) | string | n/a | yes |
| approver\_tag | Financial; Unique - email address | string | n/a | yes |
| service\_hours\_tag | Automation/Security; Sort -FullTime\|Weekdays... | string | n/a | yes |
| cloudreach\_ops\_tag | Automation/Security; Reserved for Cloudreach Ops | string | n/a | yes |
| optional\_tags | A map of tags to add to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_rg\_name | Generated vnet resource group name |
| vnet\_rg\_id | Vnet owning resource group id |
| vnet\_name | Generated vnet name |
| vnet\_id | vnet resource id |


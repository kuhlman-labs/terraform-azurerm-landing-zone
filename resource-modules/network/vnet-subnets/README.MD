# **Resource Modules: Virtual Network Subnets**

## Description
This TF module can be used to create Subnets in the specified VNet.

## Resources Created

- Subnet(s)

## Example Variables
```javascript
    resource_group = "${module.vnet.vnet_rg_name}"

    vnet_name = "${module.vnet.vnet_name}"

    subnets = [
        {
            name        = "AzureFirewallSubnet"
            subnet_cidr = "10.1.0.0/24"
        },
        {
            name        = "storage"
            subnet_cidr = "10.1.1.0/24"
            service_endpoints = "Microsoft.EventHub,Microsoft.KeyVault,Microsoft.Storage"
        }
    ]

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_group | Resource Group of vNet | string | n/a | yes |
| vnet\_name | The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created. | string | n/a | yes |
| subnets | Map of subnets with name, subnet_cidr, and service_endpoints. | list | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_ids | List of created subnets ids |
| subnet\_names | List of created subnets names |


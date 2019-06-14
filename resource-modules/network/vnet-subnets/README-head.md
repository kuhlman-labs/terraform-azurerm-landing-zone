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


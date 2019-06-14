# **Resource Modules: Network Security Group**

## Description

This TF module creates a Network Security Group with the specified security rules. The module will create a default closed off NSG if no rules are passed.

## Resources Created

- NSG
- Specified NSG Rules
- Subnet NSG Associations

## Example Variables
```javascript

## Common variables
    resource_group = "${module.vnet.vnet_rg_name}"
    subnet_ids = "${module.vnet-subnets-hub.subnet_ids}"
    subnet_names = "${module.vnet-subnets-hub.subnet_names}"

# If nsg_rules left empty "[]" a default closed nsg will be created
    nsg_rules = [
        {
            name = "testRule1"
            priority = 100
            direction = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "80"
            destination_port_range     = "80"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        },
        {
            name = "testRule2"
            priority = 110
            direction = "Inbound"
            access                     = "Deny"
            protocol                   = "Tcp"
            source_port_range          = "3389"
            destination_port_range     = "3389"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        },
        {
            name = "testRule3"
            priority = 100
            direction = "Outbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "80"
            destination_port_range     = "80"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        },
        {
            name = "testRule4"
            priority = 110
            direction = "Outbound"
            access                     = "Deny"
            protocol                   = "Tcp"
            source_port_range          = "3389"
            destination_port_range     = "3389"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }
    ]
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_group | This is the resource group to which the resources will be deployed | string | n/a | yes |
| resource\_prefix | A short pre-defined text to identify the resource type | string | `"nsg"` | no |
| environment | Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab | string | n/a | yes |
| tier | The tier of a VNet, e.g HUB, or SPK | string | n/a | yes |
| subnet\_ids | Subnets the NSG will apply to | list | n/a | yes |
| subnet\_names | Subnet names the NSG will apply to. Used for count | list | n/a | yes |
| nsg\_rules | List of NSG rules | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| nsg\_id | Network security group resource id |
| nsg\_rules\_ids | List of network security group rules ids |


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| backend\_address\_pool\_id | (Required) The ID of the Load Balancer Backend Address Pool which this Network Interface which should be connected to. Changing this forces a new resource to be created. | `string` | n/a | yes |
| ip\_configuration\_name | (Required) The Name of the IP Configuration within the Network Interface which should be connected to the Backend Address Pool. Changing this forces a new resource to be created. | `list` | n/a | yes |
| network\_interface\_id | The ID of the Subnet. Changing this forces a new resource to be created. | `list` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The (Terraform specific) ID of the Association between the Network Interface and the Load Balancers Backend Address Pool. |


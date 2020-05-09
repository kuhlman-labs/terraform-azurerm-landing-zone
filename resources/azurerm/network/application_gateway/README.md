## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| name\_prefix | Short prefix to identify resource | `string` | `"agw"` | no |
| private\_ip\_address | (Optional) The Private IP Address to use for the Application Gateway. | `string` | `null` | no |
| public\_ip\_address\_id | (Optional) The ID of a Public IP Address which the Application Gateway should use. | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| sku\_capacity | (Required) The Capacity of the SKU to use for this Application Gateway - which must be between 1 and 10, optional if autoscale\_configuration is set | `string` | `1` | no |
| sku\_name | The Name of the SKU to use for this Application Gateway. Possible values are Standard\_Small, Standard\_Medium, Standard\_Large, Standard\_v2, WAF\_Medium, WAF\_Large, and WAF\_v2. | `string` | n/a | yes |
| sku\_tier | The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard\_v2, WAF and WAF\_v2. | `string` | n/a | yes |
| subnet\_id | The ID of a Subnet. | `string` | n/a | yes |
| tags | Optional tags to be added to resource | `map` | `{}` | no |
| zones | (Optional) A collection of availability zones to spread the Application Gateway over. | `list` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
| name | n/a |


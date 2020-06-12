## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| loadbalancer\_id | (Required) The ID of the Load Balancer in which to create the Backend Address Pool. | `string` | n/a | yes |
| name | (Required) Specifies the name of the Backend Address Pool. | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Backend Address Pool. |


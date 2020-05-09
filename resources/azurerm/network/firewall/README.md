## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name\_prefix | Specifies the name of the Firewall. Changing this forces a new resource to be created. | `string` | `"firewall"` | no |
| public\_ip\_address\_id | (Optional) The ID of a Public IP Address which the Firewall should use. | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| subnet\_id | Reference to the subnet associated with the IP Configuration. | `string` | n/a | yes |
| tags | Optional tags to be added to resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| firewall\_id | n/a |
| firewall\_private\_ip | n/a |


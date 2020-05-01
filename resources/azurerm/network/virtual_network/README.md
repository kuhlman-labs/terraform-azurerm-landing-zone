## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| address\_space | This is a list of the ip address ranges for the vnet | `list` | n/a | yes |
| dns\_servers | (Optional) List of IP addresses of DNS servers | `list` | n/a | yes |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"vnet"` | no |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| resource\_group\_id | Resource group id for virtual network |
| resource\_group\_name | The name of the resource group in which to create the virtual network. |
| virtual\_network\_address\_space | The address space that is used the virtual network. |
| virtual\_network\_id | The virtual NetworkConfiguration ID. |
| virtual\_network\_name | The name of the virtual network. |

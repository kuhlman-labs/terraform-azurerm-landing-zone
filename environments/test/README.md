## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | >= 2.7.0 |
| helm | 1.1.1 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefix\_vgw | The address prefix to use for the vgw subnet. | `list` | n/a | yes |
| address\_prefixes | The address prefix to use for the subnet. | `list(string)` | n/a | yes |
| address\_prefixes\_spoke | The address prefixes to use for the subnets. | `list(string)` | n/a | yes |
| address\_space | This is a list of the ip address ranges for the vnet | `list` | n/a | yes |
| dns\_service\_ip | IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network\_plugin is set to azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| docker\_bridge\_cidr | IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network\_plugin is set to azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| region | Geographic region resource will be deployed into | `string` | n/a | yes |
| service\_cidr | The Network Range used by the Kubernetes service. This is required when network\_plugin is set to azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| spoke\_address\_space | This is a list of the ip address ranges for the vnet | `list` | n/a | yes |
| spoke\_subnet\_name\_prefixes | The name of the subnets. Changing this forces a new resource to be created. | `list(string)` | n/a | yes |
| subnet\_name\_prefixes | The name of the subnets. Changing this forces a new resource to be created. | `list(string)` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

No output.


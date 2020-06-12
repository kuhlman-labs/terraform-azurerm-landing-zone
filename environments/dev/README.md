## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | >= 2.0.0 |
| helm | 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| terraform | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefix\_agw | The address prefixe to use for the agw subnet. | `list(string)` | n/a | yes |
| address\_prefix\_aks | The address prefixe to use for the aks subnet. | `list(string)` | n/a | yes |
| address\_space | This is a list of the ip address ranges for the vnet | `list` | n/a | yes |
| app\_id | The client ID for the Service Principal | `string` | n/a | yes |
| client\_secret | The secret for the Service Principal authentication | `string` | n/a | yes |
| dns\_service\_ip | IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network\_plugin is set to azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| docker\_bridge\_cidr | IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network\_plugin is set to azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| object\_id | The object ID for the Service Principal | `string` | n/a | yes |
| region | Geographic region resource will be deployed into | `string` | n/a | yes |
| service\_cidr | The Network Range used by the Kubernetes service. This is required when network\_plugin is set to azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

No output.


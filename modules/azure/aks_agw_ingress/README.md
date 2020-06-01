## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |
| helm | n/a |
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefix\_agw | The subnet address prefix to use for the agw. | `list(string)` | n/a | yes |
| address\_prefix\_aks | The subnet address prefix to use for the aks. | `list(string)` | n/a | yes |
| app\_id | The client ID for the Service Principal | `string` | n/a | yes |
| client\_secret | The Client Secret for the Service Principal. Changing this forces a new resource to be created. | `string` | n/a | yes |
| dns\_service\_ip | IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). This is required when network\_plugin is set to azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| docker\_bridge\_cidr | IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network\_plugin is set to azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| node\_count | (Required) The number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | `number` | `1` | no |
| object\_id | The object ID for the Service Principal | `string` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| service\_cidr | The Network Range used by the Kubernetes service. This is required when network\_plugin is set to azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| tags | Optional tags to be added to resource | `map` | `{}` | no |
| virtual\_network\_name | (Required) The Name of the Virtual Network where this subnet should be located in. | `string` | n/a | yes |
| virtual\_network\_resource\_group | (Required) The Name of the Virtual Network where this subnet should be located in. | `string` | n/a | yes |
| vm\_size | (Required) The size of the Virtual Machine, such as Standard\_DS2\_v2. | `string` | `"Standard_B2s"` | no |

## Outputs

| Name | Description |
|------|-------------|
| aks\_fqdn | The FQDN of the Azure Kubernetes Managed Cluster. |
| aks\_id | The ID of the Kubernetes Managed Cluster. |
| aks\_kube\_config\_client\_certificate | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| aks\_kube\_config\_client\_key | Base64 encoded private key used by clients to authenticate to the Kubernetes cluster. |
| aks\_kube\_config\_cluster\_ca\_certificate | Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster. |
| aks\_kube\_config\_host | The Kubernetes cluster server host. |
| aks\_kube\_config\_password | A password or token used to authenticate to the Kubernetes cluster. |
| aks\_kube\_config\_raw | Raw Kubernetes config for the admin account to be used by kubectl and other compatible tools. |
| aks\_kube\_config\_username | A username used to authenticate to the Kubernetes cluster. |
| aks\_node\_resource\_group | Auto-generated Resource Group containing AKS Cluster resources. |


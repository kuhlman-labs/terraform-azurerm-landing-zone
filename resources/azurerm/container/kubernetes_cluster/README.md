## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| addon\_profile | https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#addon_profile | `list` | `[]` | no |
| api\_server\_authorized\_ip\_ranges | (Optional) The IP ranges to whitelist for incoming traffic to the masters. | `list` | `null` | no |
| availability\_zones | (Optional) A list of Availability Zones across which the Node Pool should be spread. | `list` | `null` | no |
| dns\_prefix | DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created. | `string` | `"nodes"` | no |
| enable\_auto\_scaling | (Optional) Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false. | `bool` | `null` | no |
| enable\_node\_public\_ip | (Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false. | `bool` | `null` | no |
| enable\_pod\_security\_policy | (Optional) Whether Pod Security Policies are enabled. Note that this also requires role based access control to be enabled. | `bool` | `null` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| identity | (Optional) A identity block as defined below. Changing this forces a new resource to be created. | `list` | <pre>[<br>  {<br>    "type": "SystemAssigned"<br>  }<br>]</pre> | no |
| kubernetes\_version | Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). | `string` | `null` | no |
| linux\_profile | https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#linux_profile | `list` | `[]` | no |
| max\_count | (Required) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | `number` | `null` | no |
| max\_pods | (Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created. | `number` | `null` | no |
| min\_count | (Required) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | `number` | `null` | no |
| name | (Required) The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created. | `string` | `"default"` | no |
| name\_prefix | Short prefix to identify resource | `string` | `"aks"` | no |
| network\_profile | https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#network_profile | `list` | `[]` | no |
| node\_count | (Required) The number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | `number` | `null` | no |
| node\_labels | (Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. | `map` | `null` | no |
| node\_resource\_group | (Optional) The name of the resource Group where the the Kubernetes Nodes should exist. Changing this forces a new resource to be created. | `string` | `null` | no |
| node\_taints | (Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g key=value:NoSchedule). | `list` | `null` | no |
| os\_disk\_size\_gb | (Optional) The size of the OS Disk which should be used for each agent in the Node Pool. Changing this forces a new resource to be created. | `number` | `null` | no |
| private\_cluster\_enabled | Should this Kubernetes Cluster have it's API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created. | `bool` | `null` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| role\_based\_access\_control | https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#role_based_access_control | `list` | `[]` | no |
| service\_principal | (Optional) A service\_principal block as documented below. | `list` | `[]` | no |
| tags | Optional tags to be added to resource | `map` | `{}` | no |
| type | (Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets. | `string` | `null` | no |
| vm\_size | (Required) The size of the Virtual Machine, such as Standard\_DS2\_v2. | `string` | n/a | yes |
| vnet\_subnet\_id | (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created. | `string` | `null` | no |
| windows\_profile | https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#windows_profile | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| fqdn | n/a |
| id | n/a |
| kube\_config\_client\_certificate | n/a |
| kube\_config\_client\_key | n/a |
| kube\_config\_cluster\_ca\_certificate | n/a |
| kube\_config\_host | n/a |
| kube\_config\_password | n/a |
| kube\_config\_raw | n/a |
| kube\_config\_username | n/a |
| name | n/a |
| node\_resource\_group | n/a |


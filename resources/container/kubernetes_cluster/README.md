## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aci\_connector\_linux\_enabled | (Required) Is the virtual node addon enabled? | `string` | n/a | yes |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| linux\_profile\_admin\_username | (Required) The Admin Username for the Cluster. Changing this forces a new resource to be created. | `string` | n/a | yes |
| linux\_profile\_key\_data | (Required) An ssh\_key block. Only one is currently allowed. Changing this forces a new resource to be created. | `string` | n/a | yes |
| log\_analytics\_workspace\_id | The ID of the Log Analytics Workspace which the OMS Agent should send data to. Must be present if enabled is true. | `string` | n/a | yes |
| network\_plugin | (Required) Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created. | `string` | n/a | yes |    
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| vm\_size | (Required) The size of the Virtual Machine, such as Standard\_DS2\_v2. | `string` | n/a | yes |
| aci\_connector\_linux\_subnet\_name | (Optional) The subnet name for the virtual nodes to run. This is required when aci\_connector\_linux enabled argument is set to true. | `string` | `null` | no |
| api\_server\_authorized\_ip\_ranges | (Optional) The IP ranges to whitelist for incoming traffic to the masters. | `list(string)` | `null` | no |
| availability\_zones | (Optional) A list of Availability Zones across which the Node Pool should be spread. | `list(any)` | `null` | no |
| dns\_bridge\_cidr | (Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created. | `string` | `null` | no |
| dns\_prefix | DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created. | `string` | `"nodes"` | no |
| dns\_service\_ip | (Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created. | `string` | `null` | no |
| docker\_bridge\_cidr | (Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created. | `string` | `null` | no |        
| enable\_auto\_scaling | (Optional) Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false. | `bool` | `null` | no |
| enable\_node\_public\_ip | (Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false. | `bool` | `null` | no |
| identity\_type | The type of identity used for the managed cluster. At this time the only supported value is SystemAssigned | `string` | `"SystemAssigned"` | no |
| idle\_timeout\_in\_minutes | (Optional) Desired outbound flow idle timeout in minutes for the cluster load balancer. Must be between 4 and 120 inclusive. Defaults to 30. | `number` | `null` | no || kubernetes\_version | Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). | `string` | `null` | no |
| managed\_outbound\_ip\_count | (Optional) Count of desired managed outbound IPs for the cluster load balancer. Must be between 1 and 100 inclusive. | `number` | `null` | no |
| max\_count | (Required) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | `number` | `null` | no |
| max\_pods | (Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created. | `number` | `null` | no |
| min\_count | (Required) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | `number` | `null` | no |
| name\_prefix | Short prefix to identify resource | `string` | `"aks"` | no |
| network\_policy | (Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created. | `string` | `null` | no |
| node\_count | (Required) The number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | `number` | `null` | no |
| node\_labels | (Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. | `map(any)` | `null` | no |
| node\_pool\_name | (Required) The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created. | `string` | `"default"` | no |
| node\_taints | (Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g key=value:NoSchedule). | `list(any)` | `null` | no |
| os\_disk\_size\_gb | (Optional) The size of the OS Disk which should be used for each agent in the Node Pool. Changing this forces a new resource to be created. | `number` | `null` | no |
| outbound\_ip\_address\_ids | (Optional) The ID of the Public IP Addresses which should be used for outbound communication for the cluster load balancer. | `list(string)` | `null` | no |
| outbound\_ip\_prefix\_ids | (Optional) The ID of the outbound Public IP Address Prefixes which should be used for the cluster load balancer. | `list(string)` | `null` | no |
| outbound\_ports\_allocated | (Optional) Number of desired SNAT port for each VM in the clusters load balancer. Must be between 0 and 64000 inclusive. Defaults to 0. | `number` | `null` | no |     
| outbound\_type | (Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer. | `string` | `null` | no |
| pod\_cidr | (Optional) The CIDR to use for pod IP addresses. This field can only be set when network\_plugin is set to kubenet. Changing this forces a new resource to be created. | `string` | `null` | no |
| private\_cluster\_enabled | Should this Kubernetes Cluster have it's API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created. | `bool` | `null` | no |
| service\_cidr | (Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created. | `string` | `null` | no |
| sku\_tier | (Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid (which includes the Uptime SLA). Defaults to Free. | `string` | `null` | no || tags | Optional tags to be added to resource | `map(any)` | `{}` | no |
| type | (Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets. | `string` | `null` | no |   
| vnet\_subnet\_id | (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created. | `string` | `null` | no |

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

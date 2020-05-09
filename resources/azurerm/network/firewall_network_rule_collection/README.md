## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azure\_firewall\_name | (Required) Specifies the name of the Firewall in which the Network Rule Collection should be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| collection\_action | Specifies the action the rule will apply to matching traffic. Possible values are Allow and Deny. | `string` | n/a | yes |
| collection\_priority | Specifies the priority of the rule collection. Possible values are between 100 - 65000. | `string` | n/a | yes |
| name\_prefix | Specifies the name of the Firewall. Changing this forces a new resource to be created. | `string` | `"firewall-network-rule-collection"` | no |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| rule | n/a | `list` | `[]` | no |
| tags | Optional tags to be added to resource | `map` | `{}` | no |

## Outputs

No output.


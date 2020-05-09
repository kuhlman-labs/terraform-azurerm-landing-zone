## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name\_prefix | a short pre-defined text to identify resource type | `string` | `"log-aw"` | no |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| retention\_period | Time in days to retain logs in the log analytics workspace | `string` | `30` | no |
| sku | sku for Log Analytics Workspace | `string` | `"PerGB2018"` | no |
| tags | Optional tags to be added to resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| log\_analytics\_id | Log Analytics Workspace id |
| log\_analytics\_primary\_shared\_key | Primary shared key for the Log Analytics Workspace |
| log\_analytics\_workspace\_id | Workspace (or Customer) ID for the Log Analytics Workspace |


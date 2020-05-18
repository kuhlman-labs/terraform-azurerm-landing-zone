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
| name\_prefix | a short pre-defined text to identify resource type | `string` | `"log"` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| retention\_in\_days | (Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730. | `number` | `null` | no |
| sku | (Required) Specifies the Sku of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, and PerGB2018 (new Sku as of 2018-04-03). | `string` | n/a | yes |
| tags | Optional tags to be added to resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Log Analytics Workspace id |
| primary\_shared\_key | Primary shared key for the Log Analytics Workspace |
| workspace\_id | Workspace (or Customer) ID for the Log Analytics Workspace |


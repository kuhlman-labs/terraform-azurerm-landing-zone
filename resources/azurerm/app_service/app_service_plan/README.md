## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_service\_environment\_id | (Optional) The ID of the App Service Environment where the App Service Plan should be located. Changing forces a new resource to be created. | `string` | `null` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| kind | (Optional) The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created. | `string` | `null` | no |
| maximum\_elastic\_worker\_count | The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan. | `number` | `null` | no |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"plan"` | no |
| per\_site\_scaling | (Optional) Can Apps assigned to this App Service Plan be scaled independently? If set to false apps assigned to this plan will scale to all instances of the plan. Defaults to false. | `bool` | `null` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| reserved | (Optional) Is this App Service Plan Reserved. Defaults to false. | `bool` | `null` | no |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| sku\_capacity | (Optional) Specifies the number of workers associated with this App Service Plan. | `number` | `null` | no |
| sku\_size | (Required) Specifies the plan's instance size. | `string` | n/a | yes |
| sku\_tier | (Required) Specifies the plan's pricing tier. | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the App Service Plan. |


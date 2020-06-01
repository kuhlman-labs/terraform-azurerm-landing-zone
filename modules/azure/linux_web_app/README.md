## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| sku\_size | (Required) Specifies the plan's instance size. | `string` | `"F1"` | no |
| sku\_tier | (Required) Specifies the plan's pricing tier. | `string` | `"Free"` | no |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

No output.


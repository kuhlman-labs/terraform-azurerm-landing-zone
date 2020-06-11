## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| object\_id | The object ID for the Service Principal | `string` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| sku\_name | The Name of the sku used for this Key Vault. Possible values are standard and premium. | `string` | `"standard"` | no |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

No output.


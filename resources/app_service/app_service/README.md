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
| app\_service\_plan\_id | (Required) The ID of the App Service Plan within which to create this App Service. | `string` | n/a | yes |
| app\_settings | (Optional) A key-value pair of App Settings. | `map` | `null` | no |
| auth\_settings | (Optional) A auth\_settings block as defined below. | `list` | `[]` | no |
| backup | (Optional) A backup block as defined below. | `list` | `[]` | no |
| client\_affinity\_enabled | (Optional) Should the App Service send session affinity cookies, which route client requests in the same session to the same instance? | `bool` | `null` | no |
| client\_cert\_enabled | (Optional) Does the App Service require client certificates for incoming requests? Defaults to false. | `bool` | `null` | no |
| connection\_string | (Optional) One or more connection\_string blocks as defined below. | `list` | `[]` | no |
| enabled | (Optional) Is the App Service Enabled? | `bool` | `null` | no |
| environment | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| https\_only | (Optional) Can the App Service only be accessed via HTTPS? Defaults to false. | `bool` | `null` | no |
| identity | (Optional) A Managed Service Identity block as defined below. | `list` | `[]` | no |
| logs | (Optional) A logs block as defined below. | `list` | `[]` | no |
| name\_prefix | A short pre-defined text to identify the resource type | `string` | `"app"` | no |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| resource\_group | The name of the target resource group | `string` | n/a | yes |
| site\_config | (Optional) A site\_config block as defined below. | `list` | `[]` | no |
| storage\_account | (Optional) One or more storage\_account blocks as defined below. | `list` | `[]` | no |
| tags | A map of tags to add to all resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| default\_site\_hostname | The Name of this Resource Group. |
| id | The ID of the App Service. |


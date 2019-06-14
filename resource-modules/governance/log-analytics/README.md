# **Resource Modules: Log Analytics**

## Description

This TF module creates a Log Analytics Workspace in the provided resource group.

## Resources created

- Key Vault

## Example Variables
```javascript

  environment = "p"
  region      = "eastus"
  tenant_id   = "${var.tenant_id}"
  object_id   = "${var.app_id}"
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_group | The name of the target resource group | string | n/a | yes |
| sku | sku for Log Analytics Workspace | string | `"PerGB2018"` | no |
| retention\_period | Time in days to retain logs in the log analytics workspace | string | `"30"` | no |
| owner\_tag | APP/Technical; Email address of App/Product Owner | string | n/a | yes |
| region\_tag | Financial; i.e. Sharepoint Global | string | n/a | yes |
| cost\_center\_tag | Financial; Unique - Code provided directly from Finance (BU/Brand) | string | n/a | yes |
| approver\_tag | Financial; Unique - email address | string | n/a | yes |
| service\_hours\_tag | Automation/Security; Sort -FullTime\|Weekdays... | string | n/a | yes |
| cloudreach\_ops\_tag | Automation/Security; Reserved for Cloudreach Ops | string | n/a | yes |
| optional\_tags | Optional tags to be added to resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| log\_analytics\_id | Log Analytics Workspace id |
| log\_analytics\_primary\_shared\_key | Primary shared key for the Log Analytics Workspace |
| log\_analytics\_workspace\_id | Workspace (or Customer) ID for the Log Analytics Workspace |


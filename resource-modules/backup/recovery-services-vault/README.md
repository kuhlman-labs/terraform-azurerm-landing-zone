# **Resource Modules: Recovery Services Vault**

## Description

This TF module creates a Recovery Services Vault within an existing resource group. The vault will be created with the same name as the resource group.

## Resources created

- Recovery Services Vault

## Example Variables
```javascript
  resource_group  = "RECOVERY_USEAST_P"
  sku             = "Standard"
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_group | The name of the target resource group | string | n/a | yes |
| sku | SKU for Recovery Services Vault | string | `"Standard"` | no |
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
| recovery\_services\_id | Recovery Services Vault resource id |


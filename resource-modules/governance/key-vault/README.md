# **Resource Modules: Key Vault**

## Description

This TF module creates a key vault with a default access policy granting the executing user access to the vault. The name of the vault is generated to make sure that it is global unique.

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
| sku | The Name of the sku used for this Key Vault. Possible values are standard and premium. | string | `"standard"` | no |
| tenant\_id | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. | string | n/a | yes |
| object\_id | The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. | string | n/a | yes |
| owner\_tag | APP/Technical; Email address of App/Product Owner | string | n/a | yes |
| region\_tag | Financial; i.e. Sharepoint Global | string | n/a | yes |
| cost\_center\_tag | Financial; Unique - Code provided directly from Finance (BU/Brand) | string | n/a | yes |
| approver\_tag | Financial; Unique - email address | string | n/a | yes |
| service\_hours\_tag | Automation/Security; Sort -FullTime\|Weekdays... | string | n/a | yes |

| optional\_tags | Optional tags to be added to resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_vault\_id | Key Vault resource id |


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| certificate\_contents | The base64-encoded certificate contents. Changing this forces a new resource to be created. | `string` | n/a | yes |
| certificate\_name | (Required) Specifies the name of the Key Vault Certificate. Changing this forces a new resource to be created. | `string` | `"imported-cert"` | no |
| certificate\_password | The password associated with the certificate. Changing this forces a new resource to be created. | `string` | n/a | yes |
| issuer\_name | (Required) The name of the Certificate Issuer. Possible values include Self, or the name of a certificate issuing authority supported by Azure. Changing this forces a new resource to be created. | `string` | `"Self"` | no |
| key\_exportable | (Required) Is this Certificate Exportable? Changing this forces a new resource to be created. | `bool` | `true` | no |
| key\_reuse | (Required) Is the key reusable? Changing this forces a new resource to be created. | `bool` | `true` | no |
| key\_size | (Required) The size of the Key used in the Certificate. Possible values include 2048 and 4096. Changing this forces a new resource to be created. | `string` | `"2048"` | no |
| key\_type | (Required) Specifies the Type of Key, such as RSA. Changing this forces a new resource to be created. | `string` | `"RSA"` | no |
| key\_vault\_id | ID for the Key Vault that the certificate will be generated in | `string` | n/a | yes |
| secret\_content\_type | (Required) The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM. Changing this forces a new resource to be created. | `string` | `"application/x-pkcs12"` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_vault\_import\_certificate\_data | Raw Key Vault certificate data |


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| action\_type | (Required) The Type of action to be performed when the lifetime trigger is triggerec. Possible values include AutoRenew and EmailContacts. Changing this forces a new resource to be created. | `string` | `"AutoRenew"` | no |
| certificate | (Optional) A certificate block as defined below, used to Import an existing certificate. | `list` | `[]` | no |
| certificate\_name | (Required) Specifies the name of the Key Vault Certificate. Changing this forces a new resource to be created. | `string` | n/a | yes |
| content\_type | (Required) The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM. Changing this forces a new resource to be created. | `string` | n/a | yes |
| days\_before\_expiry | (Optional) The number of days before the Certificate expires that the action associated with this Trigger should run. Changing this forces a new resource to be created. Conflicts with lifetime\_percentage. | `number` | `60` | no |
| dns\_names | (Optional) A list of alternative DNS names (FQDNs) identified by the Certificate. Changing this forces a new resource to be created. | `list` | `[]` | no |
| emails | (Optional) A list of email addresses identified by this Certificate. Changing this forces a new resource to be created. | `list` | `[]` | no |
| exportable | (Required) Is this Certificate Exportable? Changing this forces a new resource to be created. | `bool` | n/a | yes |
| extended\_key\_usage | (Optional) A list of Extended/Enhanced Key Usages. Changing this forces a new resource to be created. | `list` | `[]` | no |
| issuer\_name | (Required) The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown (for a certificate issuing authority like Let's Encrypt and Azure direct supported ones). Changing this forces a new resource to be created. | `string` | `"Self"` | no |
| key\_size | (Required) The size of the Key used in the Certificate. Possible values include 2048 and 4096. Changing this forces a new resource to be created. | `number` | n/a | yes |
| key\_type | (Required) Specifies the Type of Key, such as RSA. Changing this forces a new resource to be created. | `string` | n/a | yes |
| key\_usage | (Required) A list of uses associated with this Key. Possible values include cRLSign, dataEncipherment, decipherOnly, digitalSignature, encipherOnly, keyAgreement, keyCertSign, keyEncipherment and nonRepudiation and are case-sensitive. Changing this forces a new resource to be created. | `list` | `[]` | no |
| key\_vault\_id | ID for the Key Vault that the certificate will be generated in | `string` | n/a | yes |
| lifetime\_percentage | (Optional) The percentage at which during the Certificates Lifetime the action associated with this Trigger should run. Changing this forces a new resource to be created. Conflicts with days\_before\_expiry. | `number` | `null` | no |
| reuse\_key | (Required) Is the key reusable? Changing this forces a new resource to be created. | `bool` | n/a | yes |
| subject | (Required) The Certificate's Subject. Changing this forces a new resource to be created. | `string` | n/a | yes |
| tags | tags to be added to resource | `map` | `{}` | no |
| upns | (Optional) A list of User Principal Names identified by the Certificate. Changing this forces a new resource to be created. | `list` | `[]` | no |
| validity\_in\_months | (Required) The Certificates Validity Period in Months. Changing this forces a new resource to be created. | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| certificate\_data | The raw Key Vault Certificate data represented as a hexadecimal string. |
| id | The Key Vault Certificate ID. |
| thumbprint | The X509 Thumbprint of the Key Vault Certificate represented as a hexadecimal string. |


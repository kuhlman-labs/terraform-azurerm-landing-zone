
# Module `resources/governance/key-vault-certificate-import`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `certificate_contents` (required): The base64-encoded certificate contents. Changing this forces a new resource to be created.
* `certificate_name` (default `"imported-cert"`):  (Required) Specifies the name of the Key Vault Certificate. Changing this forces a new resource to be created.
* `certificate_password` (required): The password associated with the certificate. Changing this forces a new resource to be created.
* `issuer_name` (default `"Self"`): (Required) The name of the Certificate Issuer. Possible values include Self, or the name of a certificate issuing authority supported by Azure. Changing this forces a new resource to be created.
* `key_exportable` (default `true`): (Required) Is this Certificate Exportable? Changing this forces a new resource to be created.
* `key_reuse` (default `true`): (Required) Is the key reusable? Changing this forces a new resource to be created.
* `key_size` (default `"2048"`): (Required) The size of the Key used in the Certificate. Possible values include 2048 and 4096. Changing this forces a new resource to be created.
* `key_type` (default `"RSA"`): (Required) Specifies the Type of Key, such as RSA. Changing this forces a new resource to be created.
* `key_vault_id` (required): ID for the Key Vault that the certificate will be generated in
* `secret_content_type` (default `"application/x-pkcs12"`): (Required) The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM. Changing this forces a new resource to be created.

## Output Values
* `key_vault_import_certificate_data`: Raw Key Vault certificate data

## Managed Resources
* `azurerm_key_vault_certificate.base` from `azurerm`


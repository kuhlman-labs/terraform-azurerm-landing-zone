
# Module `resource-modules/governance/key-vault-p2s-certificate/`

Provider Requirements:
* **azurerm:** (any version)

## Input Variables
* `certificate_contents` (required): The base64-encoded certificate contents. Changing this forces a new resource to be created.
* `certificate_password` (required): The password associated with the certificate. Changing this forces a new resource to be created.
* `key_vault_id` (required): ID for the Key Vault that the certificate will be generated in

## Output Values
* `key_vault_p2s_certificate_data`: Raw Key Vault Certificate

## Managed Resources
* `azurerm_key_vault_certificate.p2s` from `azurerm`


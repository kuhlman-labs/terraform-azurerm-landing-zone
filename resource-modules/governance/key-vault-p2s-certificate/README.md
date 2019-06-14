# **Resource Modules: Key Vault P2S Certificate**

## Description

This TF module imports the provided certificate into the specified Key Vault named `P2SRootCert` that is designed to be used for generation of client certifications for a Point-to-Site VPN connection. Changes to the contents of the certificate or the password will force a new resource generation.

## Resources created

- Key Vault Certificate

## Example Variables
```javascript

  key_vault_id         = "${module.key-vault.key_vault_id}"
  certificate_contents = "${var.certificate_contents}"
  certificate_password = "${var.certificate_password}"
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| key\_vault\_id | ID for the Key Vault that the certificate will be generated in | string | n/a | yes |
| certificate\_contents | The base64-encoded certificate contents. Changing this forces a new resource to be created. | string | n/a | yes |
| certificate\_password | The password associated with the certificate. Changing this forces a new resource to be created. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| key\_vault\_p2s\_certificate\_data | Raw Key Vault Certificate |


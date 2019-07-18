
# Module `infrastructure-modules/key-vault-with-p2s-cert`

## Input Variables
* `certificate_contents` (required): The base64-encoded certificate contents. Changing this forces a new resource to be created.
* `certificate_password` (required): The password associated with the certificate. Changing this forces a new resource to be created.
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `region` (required): Geographic region resource will be deployed into
* `tags` (required): Optional tags to be added to resource

## Output Values
* `key_vault_id`: key vault resource id
* `key_vault_p2s_certificate_data`: raw key vault certificate

## Child Modules
* `key_vault` from `../../resource-modules/governance/key-vault`
* `key_vault_p2s_certificate` from `../../resource-modules/governance/key-vault-certificate-import`
* `resource_group` from `../../resource-modules/resource-group`


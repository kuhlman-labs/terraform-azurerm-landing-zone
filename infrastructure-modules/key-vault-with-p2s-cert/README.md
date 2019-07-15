
# Module `infrastructure-modules/key-vault-with-p2s-cert/`

## Input Variables
* `approver_tag` (required): Financial; Unique - email address
* `certificate_contents` (required): The base64-encoded certificate contents. Changing this forces a new resource to be created.
* `certificate_password` (required): The password associated with the certificate. Changing this forces a new resource to be created.
* `cost_center_tag` (required): Financial; Unique - Code provided directly from Finance (BU/Brand)
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `object_id` (required): The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies.
* `optional_tags` (required): Optional tags to be added to resource
* `owner_tag` (required): APP/Technical; Email address of App/Product Owner
* `region` (required): Geographic region resource will be deployed into
* `region_tag` (required): Financial; i.e. Sharepoint Global
* `service_hours_tag` (required): Automation/Security; Sort -FullTime\|Weekdays...
* `tenant_id` (required): The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault.

## Output Values
* `key_vault_id`: Key Vault resource id
* `key_vault_p2s_certificate_data`: Raw Key Vault Certificate

## Child Modules
* `key-vault` from `../../resource-modules/governance/key-vault`
* `key-vault-p2s-certificate` from `../../resource-modules/governance/key-vault-p2s-certificate`
* `resource_group` from `../../resource-modules/resource-group`


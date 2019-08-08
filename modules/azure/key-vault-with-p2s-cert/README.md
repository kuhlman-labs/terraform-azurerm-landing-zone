
# Module `modules/azure/key-vault-with-p2s-cert`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** `~> 1.32.0`

## Input Variables
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `region` (required): Geographic region resource will be deployed into
* `tags` (required): Optional tags to be added to resource

## Output Values
* `key_vault_id`: key vault resource id
* `key_vault_p2s_certificate_data`: raw key vault certificate

## Child Modules
* `key_vault` from `../../../resources/azure/governance/key-vault`
* `key_vault_p2s_certificate` from `../../../resources/azure/governance/key-vault-certificate-import`
* `resource_group` from `../../../resources/azure/resource-group`


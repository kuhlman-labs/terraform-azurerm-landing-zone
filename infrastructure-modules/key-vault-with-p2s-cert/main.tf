########################################################
# Setting up Infra Modules for Key Vault with a P2S cert
########################################################

module "resource_group" {
  source          = "../../resource-modules/resource-group"
  resource_prefix = "KEY-VAULT"
  region          = var.region
  environment     = var.environment
}

module "key-vault" {
  source         = "../../resource-modules/governance/key-vault"
  resource_group = module.resource_group.resource_group_name
  tags           = var.tags
}

module "key-vault-p2s-certificate" {
  source               = "../../resource-modules/governance/key-vault-p2s-certificate"
  key_vault_id         = module.key-vault.key_vault_id
  certificate_contents = var.certificate_contents
  certificate_password = var.certificate_password
}


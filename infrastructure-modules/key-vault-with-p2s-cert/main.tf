########################################################
# Setting up Infra Modules for Key Vault with a P2S cert
########################################################

module "resource_group" {
  source          = "../../resource-modules/resource-group"
  resource_prefix = "key-vault"
  region          = var.region
  environment     = var.environment
}

module "key_vault" {
  source         = "../../resource-modules/governance/key-vault"
  resource_group = module.resource_group.resource_group_name
  tags           = var.tags
}

module "key_vault_p2s_certificate" {
  source               = "../../resource-modules/governance/key-vault-certificate-import"
  key_vault_id         = module.key_vault.key_vault_id
  certificate_contents = var.certificate_contents
  certificate_password = var.certificate_password
}


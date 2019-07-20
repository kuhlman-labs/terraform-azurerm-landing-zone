########################################################
# Setting up Infra Modules for Key Vault with a P2S cert
########################################################

module "resource_group" {
  source          = "../../resources/azure/resource-group"
  resource_prefix = "key-vault"
  region          = var.region
  environment     = var.environment
}

module "key_vault" {
  source         = "../../resources/azure/governance/key-vault"
  resource_group = module.resource_group.resource_group_name
  tags           = var.tags
}

module "key_vault_p2s_certificate" {
  source               = "../../resources/azure/governance/key-vault-certificate-import"
  key_vault_id         = module.key_vault.key_vault_id
  certificate_contents = "${path.module}/AzureP2SRootCert.pfx"
  certificate_password = ""
}


##############################
# Shared Services Composistion
##############################

module "shared-network-hub" {
  source              = "../../infrastructure-modules/network-hub"
  vnet_address_ranges = var.vnet_address_ranges
  subnets_hub         = var.subnets_hub
  nsg_rules_dmz       = var.nsg_rules
  #certificate_data      = module.key-vault-with-p2s-cert.key_vault_p2s_certificate_data
  client_address_spaces = var.client_address_spaces
  vpn_client_protocols  = var.vpn_client_protocols
  environment           = var.environment
  region                = var.region

  #TAGS#
  approver_tag      = var.approver_tag
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  service_hours_tag = var.service_hours_tag

  optional_tags = var.optional_tags
}

module "log-analytics" {
  source           = "../../infrastructure-modules/log-analytics"
  environment      = var.environment
  region           = var.region
  retention_period = "90"
  resource_prefix  = "SS-LOGAW"

  #TAGS#
  approver_tag      = var.approver_tag
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  service_hours_tag = var.service_hours_tag

  optional_tags = var.optional_tags
}

module "key-vault-with-p2s-cert" {
  source               = "../../infrastructure-modules/key-vault-with-p2s-cert"
  environment          = var.environment
  region               = var.region
  tenant_id            = var.tenant_id
  object_id            = var.app_id
  certificate_contents = filebase64("${path.module}/AzureP2SRootCert.pfx")
  certificate_password = ""

  #TAGS#
  approver_tag      = var.approver_tag
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  service_hours_tag = var.service_hours_tag

  optional_tags = var.optional_tags
}

resource "random_string" "sa_name_rdm" {
  length  = 24 - length(var.diag_acc_prefix)
  upper   = false
  lower   = true
  number  = true
  special = false
}

module "diag_storage_account" {
  source          = "../../infrastructure-modules/storage-account"
  resource_prefix = var.diag_acc_prefix
  environment     = var.environment
  region          = var.region

  stor_name            = random_string.sa_name_rdm.result
  stor_kind            = var.diag_kind
  stor_tier            = var.diag_tier
  stor_blob_encryption = var.diag_blob_encryption
  stor_file_encryption = var.diag_file_encryption
  stor_replication     = var.diag_replication
  access_tier          = var.diag_access_tier

  #TAGS#
  approver_tag      = var.approver_tag
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  service_hours_tag = var.service_hours_tag

  optional_tags = var.optional_tags
}


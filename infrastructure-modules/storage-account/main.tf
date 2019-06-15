module "resource_group" {
  source          = "../../resource-modules/resource-group"
  resource_prefix = var.resource_prefix
  region          = var.region
  environment     = var.environment
}

module "storage_account" {
  source          = "../../resource-modules/storage/storage-account"
  resource_group  = module.resource_group.resource_group_name
  resource_prefix = var.resource_prefix
  stor_name       = var.stor_name

  stor_kind            = var.stor_kind
  stor_tier            = var.stor_tier
  stor_blob_encryption = var.stor_blob_encryption
  stor_file_encryption = var.stor_file_encryption
  stor_replication     = var.stor_replication
  access_tier          = var.access_tier

  # Tagging Variables

  owner_tag          = var.owner_tag
  region_tag         = var.region_tag
  cost_center_tag    = var.cost_center_tag
  approver_tag       = var.approver_tag
  service_hours_tag  = var.service_hours_tag
  cloudreach_ops_tag = var.cloudreach_ops_tag
  optional_tags      = var.optional_tags
}


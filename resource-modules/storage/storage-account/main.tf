###########################
#Setting up Locals for Tags
###########################

locals {
  MANDATORY_TAGS = {
    Name           = "${var.resource_prefix}${var.stor_name}"
    Owner          = var.owner_tag
    region         = var.region_tag
    Cost-Center    = var.cost_center_tag
    Approver       = var.approver_tag
    Service-Hours  = var.service_hours_tag
    Cloudreach-ops = var.cloudreach_ops_tag
  }
}

###########################
# Setting up Resource Group
###########################

data "azurerm_resource_group" "storage_account" {
  name = var.resource_group
}

resource "azurerm_storage_account" "main" {
  /* COMPULSORY VARIABLES */
  name                     = "${var.resource_prefix}${var.stor_name}"
  resource_group_name      = data.azurerm_resource_group.storage_account.name
  location                 = data.azurerm_resource_group.storage_account.location
  account_tier             = var.stor_tier
  account_replication_type = var.stor_replication

  /* OPTIONAL VARIABLES */
  access_tier            = lower(var.stor_kind) == "blobstorage" || lower(var.stor_kind) == "storagev2" ? var.access_tier : ""
  account_kind           = var.stor_kind
  enable_blob_encryption = var.stor_blob_encryption
  enable_file_encryption = var.stor_file_encryption

  tags = merge(local.MANDATORY_TAGS, var.optional_tags)
}


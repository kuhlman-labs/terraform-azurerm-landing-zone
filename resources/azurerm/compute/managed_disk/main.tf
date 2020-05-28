###
# resource composition
###

resource "azurerm_managed_disk" "base" {
  name                   = var.name_prefix
  location               = var.region
  resource_group_name    = var.resource_group
  storage_account_type   = var.storage_account_type
  create_option          = var.create_option
  disk_size_gb           = var.disk_size_gb
  disk_encryption_set_id = var.disk_encryption_set_id
  disk_iops_read_write   = var.disk_iops_read_write
  image_reference_id     = var.image_reference_id
  os_type                = var.os_type
  source_resource_id     = var.source_resource_id
  source_uri             = var.source_uri
  storage_account_id     = var.storage_account_id
  zones                  = var.zones
  dynamic "encryption_settings" {
    for_each = var.encryption_settings
    content {
      enabled             = encryption_settings.value.enabled
      disk_encryption_key {
        secret_url = encryption_settings.value.disk_encryption_key_secret_url
        source_vault_id = encryption_settings.value.disk_encryption_key_source_vault_id
      }
      key_encryption_key {
        key_url = encryption_settings.value.key_encryption_key_key_url
        source_vault_id = encryption_settings.value.key_encryption_key_source_vault_id
      }
    }
  }
  tags = var.tags

}
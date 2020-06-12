###
# resource composition
###

#windows virtual machine

resource "azurerm_windows_virtual_machine" "base" {
  count = var.vm_count

  name                         = "${var.name_prefix}-${count.index}-${var.environment}-${var.region}"
  resource_group_name          = var.resource_group
  location                     = var.region
  size                         = var.size
  admin_username               = var.admin_username
  admin_password               = var.admin_password
  network_interface_ids        = [element(var.network_interface_ids, count.index)]
  allow_extension_operations   = var.allow_extension_operations
  availability_set_id          = var.availability_set_id
  computer_name                = "${substr(var.name_prefix, 4, 8)}-${count.index}-${substr(var.environment, 0, 2)}${substr(var.region, 0, 2)}"
  custom_data                  = var.custom_data
  dedicated_host_id            = var.dedicated_host_id
  enable_automatic_updates     = var.enable_automatic_updates
  eviction_policy              = var.eviction_policy
  license_type                 = var.license_type
  max_bid_price                = var.max_bid_price
  priority                     = var.priority
  provision_vm_agent           = var.provision_vm_agent
  proximity_placement_group_id = var.proximity_placement_group_id
  source_image_id              = var.source_image_id
  timezone                     = var.timezone
  zone                         = var.enable_zone == false ? null : element(var.zone, count.index)
  tags                         = var.tags

  os_disk {
    caching                   = var.os_disk_caching
    storage_account_type      = var.os_disk_storage_account_type
    disk_encryption_set_id    = var.os_disk_encryption_set_id
    disk_size_gb              = var.os_disk_size_gb
    name                      = "osdisk-${var.name_prefix}-${count.index}-${var.environment}-${var.region}"
    write_accelerator_enabled = var.os_disk_write_accelerator_enabled
  }

  source_image_reference {
    publisher = var.source_image_reference_publisher
    offer     = var.source_image_reference_offer
    sku       = var.source_image_reference_sku
    version   = var.source_image_reference_version
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  dynamic "additional_capabilities" {
    for_each = var.additional_capabilities
    content {
      ultra_ssd_enabled = additional_capabilities.value.ultra_ssd_enabled
    }
  }

  dynamic "additional_unattend_content" {
    for_each = var.additional_unattend_content
    content {
      content = additional_unattend_content.value.content
      setting = additional_unattend_content.value.setting
    }
  }

  dynamic "secret" {
    for_each = var.secret
    content {
      certificate {
        store = secret.value.store
        url   = secret.slue.url
      }
      key_vault_id = secret.value.key_vault_id
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "plan" {
    for_each = var.plan
    content {
      name      = plan.value.name
      product   = plan.value.product
      publisher = plan.value.publisher
    }
  }

  dynamic "winrm_listener" {
    for_each = var.winrm_listener
    content {
      protocol        = winrm_listener.value.protocol
      certificate_url = winrm_listener.value.certificate_url
    }
  }
}
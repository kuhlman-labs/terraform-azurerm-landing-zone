###
# resource composition
###

resource "azurerm_virtual_machine_data_disk_attachment" "base" {
  count = length(var.managed_disk_id)

  managed_disk_id           = element(var.managed_disk_id, count.index)
  virtual_machine_id        = element(var.virtual_machine_id, count.index)
  lun                       = var.lun
  caching                   = var.caching
  create_option             = var.create_option
  write_accelerator_enabled = var.write_accelerator_enabled
}
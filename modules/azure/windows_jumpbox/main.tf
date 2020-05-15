###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "vm-stdiag-logs"
  region       = var.region
  environment  = var.environment
}

#nic

module "network_interface" {
  source         = "../../../resources/azurerm/network/network_interface"
  resource_group = module.resource_group.name
  environment    = var.environment
  name_prefix = "nic-wvm-jumpbox"
  subnet_id = var.subnet_id
  private_ip_address_allocation = "Dynamic"
}

#vm

module "virtual_machine" {
  source         = "../../../resources/azurerm/compute/windows_virtual_machine"
  resource_group = module.resource_group.name
  environment    = var.environment
  name_prefix = "wvm-jumpbox"
  admin_username = "kuhlmanlabs"
  os_disk_storage_account_type = "Standard_LRS"
  size = "Standard_F2"
  network_interface_ids = module.network_interface.id
}
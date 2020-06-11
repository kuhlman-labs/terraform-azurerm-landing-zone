###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "glusterfs"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

#subnet

module "subnet" {
  source               = "../../../resources/azurerm/network/subnet"
  resource_group       = var.virtual_network_resource_group
  region               = module.resource_group.location
  virtual_network_name = var.virtual_network_name
  name_prefixes        = ["snet-glusterfs"]
  address_prefixes     = var.address_prefix_glusterfs
  environment          = var.environment
}

##glusterfs cluster

module "lb_glusterfs" {
  source                        = "../../../resources/azurerm/network/lb"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "lbi-glusterfs"
  tags                          = var.tags
  sku                           = "Standard"
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Dynamic"
}

module "lb_backend_address_pool_glusterfs" {
  source          = "../../../resources/azurerm/network/lb_backend_address_pool"
  resource_group  = module.resource_group.name
  name            = "beap-glusterfs"
  loadbalancer_id = module.lb_glusterfs.id
}

module "network_interface_glusterfs" {
  source                        = "../../../resources/azurerm/network/network_interface"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "nic-lvm-glusterfs"
  nic_count                     = 2
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}

module "network_interface_backend_address_pool_association_glusterfs" {
  source                  = "../../../resources/azurerm/network/network_interface_backend_address_pool_association"
  network_interface_id    = module.network_interface_glusterfs.id
  ip_configuration_name   = module.network_interface_glusterfs.ip_configuration_name
  backend_address_pool_id = module.lb_backend_address_pool_glusterfs.id
}

module "virtual_machine_glusterfs" {
  source                           = "../../../resources/azurerm/compute/linux_virtual_machine"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "lvm-glusterfs"
  vm_count                         = 2
  enable_zone                      = true
  zone                             = [1, 2]
  admin_username                   = "kuhlmanlabs"
  admin_password                   = "P@ssWord098"
  disable_password_authentication  = false
  os_disk_storage_account_type     = "Premium_LRS"
  os_disk_caching                  = "None"
  size                             = var.vm_size_glusterfs
  network_interface_ids            = module.network_interface_glusterfs.id
  storage_account_uri              = var.storage_account_uri
  source_image_reference_publisher = "Redhat"
  source_image_reference_offer     = "RHEL-SAP"
  source_image_reference_sku       = "7.4"
  source_image_reference_version   = "latest"
  tags                             = var.tags
}
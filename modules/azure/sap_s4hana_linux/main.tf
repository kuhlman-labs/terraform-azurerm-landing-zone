###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "sap-s4hana"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

#subnets

module "subnet" {
  source               = "../../../resources/azurerm/network/subnet"
  resource_group       = var.virtual_network_resource_group
  region               = module.resource_group.location
  virtual_network_name = var.virtual_network_name
  name_prefixes        = ["snet-app-tier", "snet-data-tier"]
  address_prefixes     = concat(var.address_prefix_app, var.address_prefix_data)
  environment          = var.environment
}

##web dispatcher

module "lb_web_dispatcher" {
  source                        = "../../../resources/azurerm/network/lb"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "lbi-web-dispatcher"
  sku                           = "Standard"
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}

module "lb_backend_address_pool_web_dispatcher" {
  source          = "../../../resources/azurerm/network/lb_backend_address_pool"
  resource_group  = module.resource_group.name
  name            = "beap-web-dispatcher"
  loadbalancer_id = module.lb_web_dispatcher.id
}

module "network_interface_web_dispatcher" {
  source                        = "../../../resources/azurerm/network/network_interface"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "nic-lvm-sap-web-dispatcher"
  nic_count                     = 2
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}

module "network_interface_backend_address_pool_association_web_dispatcher" {
  source                  = "../../../resources/azurerm/network/network_interface_backend_address_pool_association"
  network_interface_id    = module.network_interface_web_dispatcher.id
  ip_configuration_name   = module.network_interface_web_dispatcher.ip_configuration_name
  backend_address_pool_id = module.lb_backend_address_pool_web_dispatcher.id
}

module "virtual_machine_web_dispatcher" {
  source                           = "../../../resources/azurerm/compute/linux_virtual_machine"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "lvm-sap-web-dispatcher"
  vm_count                         = 2
  enable_zone                      = true
  zone                             = [1, 2]
  admin_username                   = "kuhlmanlabs"
  admin_password                   = "P@ssWord098"
  disable_password_authentication  = false
  os_disk_storage_account_type     = "Premium_LRS"
  os_disk_caching                  = "None"
  size                             = var.vm_size_web_dispatcher
  network_interface_ids            = module.network_interface_web_dispatcher.id
  storage_account_uri              = var.storage_account_uri
  source_image_reference_publisher = "RedHat"
  source_image_reference_offer     = "RHEL-SAP"
  source_image_reference_sku       = "7.4"
  source_image_reference_version   = "latest"
  tags                             = var.tags
}

##applicaiton server

module "network_interface_app_server" {
  source                        = "../../../resources/azurerm/network/network_interface"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "nic-lvm-sap-app-server"
  nic_count                     = 2
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}

module "virtual_machine_app_server" {
  source                           = "../../../resources/azurerm/compute/linux_virtual_machine"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "lvm-sap-app-server"
  vm_count                         = 2
  enable_zone                      = true
  zone                             = [1, 2]
  admin_username                   = "kuhlmanlabs"
  admin_password                   = "P@ssWord098"
  disable_password_authentication  = false
  os_disk_storage_account_type     = "Premium_LRS"
  os_disk_caching                  = "None"
  size                             = var.vm_size_app_server
  network_interface_ids            = module.network_interface_app_server.id
  storage_account_uri              = var.storage_account_uri
  source_image_reference_publisher = "RedHat"
  source_image_reference_offer     = "RHEL-SAP"
  source_image_reference_sku       = "7.4"
  source_image_reference_version   = "latest"
  tags                             = var.tags
}

##central services

module "lb_central_services" {
  source                        = "../../../resources/azurerm/network/lb"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "lbi-central-services"
  sku                           = "Standard"
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}

module "lb_backend_address_pool_central_services" {
  source          = "../../../resources/azurerm/network/lb_backend_address_pool"
  resource_group  = module.resource_group.name
  name            = "beap-central_services"
  loadbalancer_id = module.lb_central_services.id
}

module "network_interface_central_services" {
  source                        = "../../../resources/azurerm/network/network_interface"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "nic-lvm-sap-central-services"
  nic_count                     = 2
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}

module "network_interface_backend_address_pool_association_central_services" {
  source                  = "../../../resources/azurerm/network/network_interface_backend_address_pool_association"
  network_interface_id    = module.network_interface_central_services.id
  ip_configuration_name   = module.network_interface_central_services.ip_configuration_name
  backend_address_pool_id = module.lb_backend_address_pool_central_services.id
}

module "virtual_machine_central_services" {
  source                           = "../../../resources/azurerm/compute/linux_virtual_machine"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "lvm-sap-central-services"
  vm_count                         = 2
  enable_zone                      = true
  zone                             = [1, 2]
  admin_username                   = "kuhlmanlabs"
  admin_password                   = "P@ssWord098"
  disable_password_authentication  = false
  os_disk_storage_account_type     = "Premium_LRS"
  os_disk_caching                  = "None"
  size                             = var.vm_size_central_services
  network_interface_ids            = module.network_interface_central_services.id
  storage_account_uri              = var.storage_account_uri
  source_image_reference_publisher = "RedHat"
  source_image_reference_offer     = "RHEL-SAP"
  source_image_reference_sku       = "7.4"
  source_image_reference_version   = "latest"
  tags                             = var.tags
}

##database

module "lb_database" {
  source                        = "../../../resources/azurerm/network/lb"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "lbi-database"
  sku                           = "Standard"
  subnet_id                     = element(module.subnet.id, 1)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}

module "lb_backend_address_pool_database" {
  source          = "../../../resources/azurerm/network/lb_backend_address_pool"
  resource_group  = module.resource_group.name
  name            = "beap-database"
  loadbalancer_id = module.lb_database.id
}

module "network_interface_database" {
  source                        = "../../../resources/azurerm/network/network_interface"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "nic-lvm-sap-database"
  nic_count                     = 2
  subnet_id                     = element(module.subnet.id, 1)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}

module "network_interface_backend_address_pool_association_database" {
  source                  = "../../../resources/azurerm/network/network_interface_backend_address_pool_association"
  network_interface_id    = module.network_interface_database.id
  ip_configuration_name   = module.network_interface_database.ip_configuration_name
  backend_address_pool_id = module.lb_backend_address_pool_database.id
}

module "virtual_machine_database" {
  source                           = "../../../resources/azurerm/compute/linux_virtual_machine"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "lvm-sap-database"
  vm_count                         = 2
  enable_zone                      = true
  zone                             = [1, 2]
  admin_username                   = "kuhlmanlabs"
  admin_password                   = "P@ssWord098"
  disable_password_authentication  = false
  os_disk_storage_account_type     = "Premium_LRS"
  os_disk_caching                  = "None"
  size                             = var.vm_size_database
  network_interface_ids            = module.network_interface_database.id
  storage_account_uri              = var.storage_account_uri
  source_image_reference_publisher = "RedHat"
  source_image_reference_offer     = "RHEL-SAP"
  source_image_reference_sku       = "7.4"
  source_image_reference_version   = "latest"
  tags                             = var.tags
}
###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "k8s-cluster"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

#subnets

module "subnet" {
  source               = "../../resources/network/subnet"
  resource_group       = var.virtual_network_resource_group
  region               = module.resource_group.location
  virtual_network_name = var.virtual_network_name
  name_prefixes        = ["snet-k8s-master", "snet-k8s-node"]
  address_prefixes     = concat(var.address_prefix_k8s_master, var.address_prefix_k8s_node)
  environment          = var.environment
}

#network security group

module "network_security_group" {
  source         = "../../resources/network/network_security_group"
  resource_group = module.resource_group.name
  environment    = var.environment
  region         = module.resource_group.location
  policy_name    = "k8sclusterallow"
  tags           = var.tags
}

module "subnet_network_security_group_association_0" {
  source                    = "../../resources/network/subnet_network_security_group_association"
  subnet_id                 = element(module.subnet.id, 0)
  network_security_group_id = module.network_security_group.id
}

module "subnet_network_security_group_association_1" {
  source                    = "../../resources/network/subnet_network_security_group_association"
  subnet_id                 = element(module.subnet.id, 1)
  network_security_group_id = module.network_security_group.id
}

##k8s_master
/*
module "lb_k8s_master" {
  source                        = "../../resources/network/lb"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "lbi-k8s_master"
  sku                           = "Standard"
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}

module "lb_backend_address_pool_k8s_master" {
  source          = "../../resources/network/lb_backend_address_pool"
  resource_group  = module.resource_group.name
  name            = "beap-k8s_master"
  loadbalancer_id = module.lb_k8s_master.id
}
*/
module "network_interface_k8s_master" {
  source                        = "../../resources/network/network_interface"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "nic-lvm-k8s-master"
  nic_count                     = 1
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}
/*
module "network_interface_backend_address_pool_association_k8s_master" {
  source                  = "../../resources/network/network_interface_backend_address_pool_association"
  network_interface_id    = module.network_interface_k8s_master.id
  ip_configuration_name   = module.network_interface_k8s_master.ip_configuration_name
  backend_address_pool_id = module.lb_backend_address_pool_k8s_master.id
}
*/
module "virtual_machine_k8s_master" {
  source                           = "../../resources/compute/linux_virtual_machine"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "lvm-k8s-master"
  vm_count                         = 1
  enable_zone                      = true
  zone                             = [1]
  admin_username                   = "kuhlmanlabs"
  admin_ssh_key_public_key         = "~/.ssh/id_rsa.pub"
  os_disk_storage_account_type     = "Standard_LRS"
  os_disk_caching                  = "None"
  size                             = var.vm_size_k8s_master
  network_interface_ids            = module.network_interface_k8s_master.id
  source_image_reference_publisher = "Canonical"
  source_image_reference_offer     = "UbuntuServer"
  source_image_reference_sku       = "18.04-LTS"
  source_image_reference_version   = "latest"
  tags                             = var.tags
}

##k8s_node
/*
module "lb_k8s_node" {
  source                        = "../../resources/network/lb"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "lbi-k8s-node"
  sku                           = "Standard"
  subnet_id                     = element(module.subnet.id, 0)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}

module "lb_backend_address_pool_k8s_node" {
  source          = "../../resources/network/lb_backend_address_pool"
  resource_group  = module.resource_group.name
  name            = "beap-k8s-node"
  loadbalancer_id = module.lb_k8s_node.id
}
*/
module "network_interface_k8s_node" {
  source                        = "../../resources/network/network_interface"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "nic-lvm-k8s-node"
  nic_count                     = 2
  subnet_id                     = element(module.subnet.id, 1)
  private_ip_address_allocation = "Dynamic"
  tags                          = var.tags
}
/*
module "network_interface_backend_address_pool_association_k8s_node" {
  source                  = "../../resources/network/network_interface_backend_address_pool_association"
  network_interface_id    = module.network_interface_k8s_node.id
  ip_configuration_name   = module.network_interface_k8s_node.ip_configuration_name
  backend_address_pool_id = module.lb_backend_address_pool_k8s_node.id
}
*/
module "virtual_machine_k8s_node" {
  source                           = "../../resources/compute/linux_virtual_machine"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "lvm-k8s-node"
  vm_count                         = 2
  enable_zone                      = true
  zone                             = [1, 2]
  admin_username                   = "kuhlmanlabs"
  admin_ssh_key_public_key         = "~/.ssh/id_rsa.pub"
  os_disk_storage_account_type     = "Standard_LRS"
  os_disk_caching                  = "None"
  size                             = var.vm_size_k8s_node
  network_interface_ids            = module.network_interface_k8s_node.id
  source_image_reference_publisher = "Canonical"
  source_image_reference_offer     = "UbuntuServer"
  source_image_reference_sku       = "18.04-LTS"
  source_image_reference_version   = "latest"
  tags                             = var.tags
}
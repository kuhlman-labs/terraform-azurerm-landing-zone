###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "jumpbox"
  region       = var.region
  environment  = var.environment
}

#subnet

module "subnet" {
  source               = "../../../resources/azurerm/network/subnet"
  resource_group       = var.virtual_network_resource_group
  region               = module.resource_group.location
  virtual_network_name = var.virtual_network_name
  name_prefixes        = ["snet-jumpbox"]
  address_prefixes     = var.address_prefix_jumpbox
  environment          = var.environment
}

#virtual machine

module "network_interface" {
  source                        = "../../../resources/azurerm/network/network_interface"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "nic-wvm-jumpbox"
  subnet_id                     = var.subnet_id
  private_ip_address_allocation = "Dynamic"
}

module "virtual_machine" {
  source                           = "../../../resources/azurerm/compute/windows_virtual_machine"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "wvm-jumpbox"
  computer_name                    = "jumpbox"
  admin_username                   = "kuhlmanlabs"
  admin_password                   = "P@ssWord098"
  os_disk_storage_account_type     = "Standard_LRS"
  os_disk_caching                  = "None"
  size                             = var.vm_size
  network_interface_ids            = module.network_interface.id
  storage_account_uri              = var.storage_account_uri
  source_image_reference_publisher = "MicrosoftWindowsServer"
  source_image_reference_offer     = "WindowsServer"
  source_image_reference_sku       = "2019-Datacenter"
  source_image_reference_version   = "latest"
}

#network security group

module "network_security_group" {
  source         = "../../../resources/azurerm/network/network_security_group"
  resource_group = module.resource_group.name
  environment    = var.environment
  region         = module.resource_group.location
  policy_name    = "rdpallow"
}

module "network_security_rule" {
  source                      = "../../../resources/azurerm/network/network_security_rule"
  resource_group              = module.resource_group.name
  region                      = module.resource_group.location
  network_security_group_name = module.network_security_group.name
  network_security_rules = [
    {
      name                       = "Allow RDP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "Deny RDP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "Internet"
      destination_address_prefix = "VirtualNetwork"
    }
  ]
}

module "subnet_network_security_group_association" {
  source                    = "../../../resources/azurerm/network/subnet_network_security_group_association"
  subnet_id                 = element(module.subnet.id, 0)
  network_security_group_id = module.network_security_group.id
}

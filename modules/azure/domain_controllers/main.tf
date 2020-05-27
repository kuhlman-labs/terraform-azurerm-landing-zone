###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "domain-controllers"
  region       = var.region
  environment  = var.environment
}

module "subnet" {
  source               = "../../../resources/azurerm/network/subnet"
  resource_group       = module.resource_group.name
  region               = module.resource_group.location
  virtual_network_name = var.virtual_network_name
  name_prefixes        = ["snet-active-directory"]
  address_prefixes     = var.address_prefixes
  environment          = var.environment
}

module "network_security_group" {
  source         = "../../../resources/azurerm/network/network_security_group"
  resource_group = module.resource_group.name
  environment    = var.environment
  region         = module.resource_group.location
  policy_name    = "addsallow"
}

module "network_security_rule" {
  source                      = "../../../resources/azurerm/network/network_security_rule"
  resource_group              = module.resource_group.name
  region                      = module.resource_group.location
  network_security_group_name = module.network_security_group.name
  network_security_rules = [
    {
      name                       = "LDAP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "389"
      destination_port_range     = "389"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "LDAP SSL"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "636"
      destination_port_range     = "636"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "LDAP GC"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "3268"
      destination_port_range     = "3268"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "LDAP GC SSL"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "3269"
      destination_port_range     = "3269"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "Kerberos"
      priority                   = 140
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "88"
      destination_port_range     = "88"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "DNS"
      priority                   = 150
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "53"
      destination_port_range     = "53"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "SMB,CIFS,SMB2, DFSN, LSARPC, NbtSS, NetLogonR, SamR, SrvSvc"
      priority                   = 160
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "445"
      destination_port_range     = "445"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "SMTP"
      priority                   = 170
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "25"
      destination_port_range     = "25"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "RPC, EPM"
      priority                   = 180
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "135"
      destination_port_range     = "135"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "RPC, DCOM, EPM, DRSUAPI, NetLogonR, SamR, FRS"
      priority                   = 190
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "49152-65535"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "RPC, DFSR (SYSVOL)"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "5722"
      destination_port_range     = "5722"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "Windows Time"
      priority                   = 210
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "UDP"
      source_port_range          = "123"
      destination_port_range     = "123"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "Kerberos change/set password"
      priority                   = 220
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "464"
      destination_port_range     = "464"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "DCOM, RPC, EPM"
      priority                   = 230
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "UDP"
      source_port_range          = "49152-65535"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "DFSN, NetLogon, NetBIOS Datagram Service"
      priority                   = 240
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "UDP"
      source_port_range          = "138"
      destination_port_range     = "138"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "SOAP"
      priority                   = 250
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "9389"
      destination_port_range     = "9389"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "NetLogon, NetBIOS Name Resolution"
      priority                   = 260
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "UDP"
      source_port_range          = "137"
      destination_port_range     = "137"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "DFSN, NetBIOS Session Service, NetLogon"
      priority                   = 270
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "139"
      destination_port_range     = "139"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    }  
  ]
}

module "subnet_network_security_group_association" {
  source = "../../../resources/azurerm/network/subnet_network_security_group_association"
  subnet_id = module.subnet.id
  network_security_group_id = module.network_security_group.id
}

#nic

module "network_interface" {
  source                        = "../../../resources/azurerm/network/network_interface"
  resource_group                = module.resource_group.name
  region                        = module.resource_group.location
  environment                   = var.environment
  name_prefix                   = "nic-wvm-dc"
  nic_count                     = 2
  subnet_id                     = module.subnet.id
  private_ip_address_allocation = "Static"
}

#vm

module "virtual_machine" {
  source                           = "../../../resources/azurerm/compute/windows_virtual_machine"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "wvm-dc"
  vm_count                         = 2
  zone                             = [1, 2]
  admin_username                   = "kuhlmanlabs"
  admin_password                   = "P@ssWord098"
  os_disk_storage_account_type     = "Standard_LRS"
  os_disk_caching                  = "None"
  size                             = "Standard_F2"
  network_interface_ids            = module.network_interface[count.index].id
  storage_account_uri              = var.storage_account_uri
  source_image_reference_publisher = "MicrosoftWindowsServer"
  source_image_reference_offer     = "WindowsServer"
  source_image_reference_sku       = "2019-Datacenter"
  source_image_reference_version   = "latest"
}

module "managed_disk_1" {
  source                           = "../../../resources/azurerm/compute/managed_disk"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "data-disk-${module.virtual_machine[0].name}"
}

module "managed_disk_2" {
  source                           = "../../../resources/azurerm/compute/managed_disk"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "data-disk-${module.virtual_machine[1].name}"
}

module "virtual_machine_data_disk_attachment" {
  source                           = "../../../resources/azurerm/compute/virtual_machine_data_disk_attachment"
  resource_group                   = module.resource_group.name
  region                           = module.resource_group.location
  environment                      = var.environment
  name_prefix                      = "data-disk-${module.virtual_machine[1].name}"
}

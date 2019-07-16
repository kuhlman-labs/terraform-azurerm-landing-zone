###########################
# Shared Services Variables
###########################


#common
environment = "shared-services"
region      = "eastus"

#network

vnet_address_ranges       = ["10.0.0.0/16"]
subnet_dmz_address_prefix = "10.0.1.0/24"

#nsg

nsg_rules_dmz = [
  {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "22"
    destination_port_range     = "22"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  },
  {
    name                       = "RDP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  },
]

#tags

tags = {}
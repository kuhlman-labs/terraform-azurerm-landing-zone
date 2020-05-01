###
# environment variables
###

#common
environment = "test"
region      = "eastus2"

#virtual_network
address_space   = ["10.100.0.0/16"]

#subnet

address_prefixes = ["10.100.1.0/24", "10.100.2.0/24"]


#aks

service_cidr       = "10.200.10.0/24"
dns_service_ip     = "10.200.10.10"
docker_bridge_cidr = "172.17.0.1/16"


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
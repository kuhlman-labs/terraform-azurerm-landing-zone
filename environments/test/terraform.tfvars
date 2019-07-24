###########################
# Shared Services Variables
###########################


#common
environment = "test"
region      = "eastus2"

#network

hub_vnet_address_ranges   = ["10.100.0.0/16"]
subnet_dmz_address_prefix = "10.100.1.0/24"

spoke_vnet_address_ranges       = ["10.200.0.0/16"]
subnet_frontend_address_prefix  = "10.200.1.0/24"
subnet_backend_address_prefix   = "10.200.2.0/24"
subnet_aks_nodes_address_prefix = "10.200.3.0/24"
subnet_app_gw_address_prefix    = "10.200.4.0/24"

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
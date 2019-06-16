###########################
# Shared Services Variables
###########################

environment         = "shared-services"
region              = "eastus"
vnet_address_ranges = ["10.0.0.0/16"]
subnets_hub = [
  {
    name        = "GatewaySubnet"
    subnet_cidr = "10.0.100.0/27"
  },
  {
    name        = "dmz"
    subnet_cidr = "10.0.1.0/24"
  }
]
nsg_rules = [
  {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
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
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  },
]
client_address_spaces = ["192.168.0.0/24"]
vpn_client_protocols  = ["IkeV2", "OpenVPN"]

############################
#Mandatory Tagging Variables
############################

owner_tag          = ""
region_tag         = ""
cost_center_tag    = ""
approver_tag       = ""
service_hours_tag  = ""
cloudreach_ops_tag = ""

###########################
#Optional Tagging Variables
###########################

optional_tags = {}
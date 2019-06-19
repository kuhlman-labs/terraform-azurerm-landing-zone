####################
# Pre-Prod Variables
####################

environment         = "pre-prod"
region              = "eastus"
vnet_address_ranges = ["10.1.0.0/16"]
subnets_spoke = [
  {
    name        = "aks_nodes"
    subnet_cidr = "10.1.0.0/24"
  },
  {
    name        = "virtual_node_aci"
    subnet_cidr = "10.1.1.0/24"
  },
  {
    name        = "aks_waf"
    subnet_cidr = "10.1.2.0/28"
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
############################
#Mandatory Tagging Variables
############################
owner_tag         = ""
region_tag        = ""
cost_center_tag   = ""
approver_tag      = ""
service_hours_tag = ""


###########################
#Optional Tagging Variables
###########################
optional_tags = {}
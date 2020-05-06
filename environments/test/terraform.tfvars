###
# environment values
###

#common
environment = "test"
region      = "eastus2"

#virtual_network
address_space       = ["10.100.0.0/16"]
spoke_address_space = ["10.200.0.0/16"]

#subnet

address_prefixes       = ["10.100.1.0/24", "10.100.2.0/24"]
vgw_address_prefix     = ["10.100.100.0/27"]
address_prefixes_spoke = ["10.200.1.0/24", "10.200.2.0/24"]

#tags

tags = {}
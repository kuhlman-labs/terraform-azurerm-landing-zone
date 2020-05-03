###
# environment values
###

#common
environment = "test"
region      = "eastus2"

#virtual_network
address_space = ["10.100.0.0/16"]

#subnet

address_prefixes = ["10.100.1.0/24", "10.100.2.0/24"]
vgw_address_prefix = ["10.100.100.0/27"]

#tags

tags = {}
###
# environment variables
###

#common

environment = "shared-services"
region      = "eastus"

#virtual_network

address_space = ["10.0.0.0/16"]

#subnet

subnet_name_prefixes = ["management"]
address_prefixes     = ["10.0.0.0/24"]
address_prefix_vgw   = ["10.0.10.0/27"]


#tags

tags = {}
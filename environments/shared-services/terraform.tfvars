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
address_prefix_fw    = ["10.0.11.0/26"]
address_prefix_adds  = ["10.0.12.0/24"]

#domain controllers

private_ip_address_adds = ["10.0.12.10", "10.0.12.11"]


#tags

tags = {}
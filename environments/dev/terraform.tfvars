###
# environment variables
###

#commmon

environment = "pre-prod"
region      = "eastus"

#network

vnet_address_ranges            = ["10.1.0.0/16"]
subnet_frontend_address_prefix = "10.1.0.0/24"
subnet_backend_address_prefix  = "10.1.1.0/24"

#tags

tags = {}
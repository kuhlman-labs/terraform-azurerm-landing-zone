####################
# Pre-Prod variables
####################


#commmon

environment = "prod"
region      = "eastus"

#network

vnet_address_ranges            = ["10.2.0.0/16"]
subnet_frontend_address_prefix = "10.2.0.0/24"
subnet_backend_address_prefix  = "10.2.1.0/24"

#tags

tags = {}
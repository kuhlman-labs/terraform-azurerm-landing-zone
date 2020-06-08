###
# environment values
###

#common
environment = "test"
region      = "eastus"

#virtual_network
address_space = ["10.100.0.0/16"]

#subnet

address_prefix_app       = ["10.100.1.0/24"]
address_prefix_data      = ["10.100.2.0/24"]
address_prefix_glusterfs = ["10.100.3.0/24"]

#tags

tags = {
  terraform_managed = true
}
###
# environment variables
###

#common

environment = "shared-services"
region      = "eastus"

#virtual_network

address_space = ["10.0.0.0/16"]

#subnets

address_prefix_agw     = ["10.0.10.0/27"]
address_prefix_fw      = ["10.0.11.0/26"]
address_prefix_bastion = ["10.0.14.0/24"]


#tags

tags = {
  terraform_managed = true
}
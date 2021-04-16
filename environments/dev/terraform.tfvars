###
# environment variables
###

#common

environment = "dev"
region      = "eastus"

#virtual_network

address_space = ["10.1.0.0/16"]

#subnet

address_prefix_k8s_master = ["10.1.3.0/24"]
address_prefix_k8s_node   = ["10.1.4.0/24"]



#tags

tags = {
  terraform_managed = true
}
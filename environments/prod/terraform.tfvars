###
# environment variables
###

#common

environment = "prod"
region      = "eastus"

#virtual_network

address_space = ["10.2.0.0/16"]

#subnet

subnet_name_prefixes = ["snet-agw", "snet-aks"]
address_prefixes     = ["10.2.1.0/24", "10.2.2.0/24"]

#aks

service_cidr       = "10.2.3.0/24"
dns_service_ip     = "10.2.3.10"
docker_bridge_cidr = "172.17.0.1/16"


#tags

tags = {}
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

address_prefixes           = ["10.100.1.0/24", "10.100.2.0/24"]
address_prefix_vgw         = ["10.100.100.0/27"]
address_prefixes_spoke     = ["10.200.1.0/24", "10.200.2.0/24"]
subnet_name_prefixes       = ["management"]
spoke_subnet_name_prefixes = ["snet-agw", "snet-aks"]

#aks

service_cidr       = "10.200.3.0/24"
dns_service_ip     = "10.200.3.10"
docker_bridge_cidr = "172.17.0.1/16"

#tags

tags = {}
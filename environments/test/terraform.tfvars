###
# environment values
###

#common
environment = "test"
region      = "eastus"

#virtual_network
address_space = ["10.100.0.0/16"]

#subnet

address_prefix_aks = ["10.100.1.0/24"]

#aks

service_cidr       = "10.100.3.0/24"
dns_service_ip     = "10.100.3.10"
docker_bridge_cidr = "172.18.0.1/16"

#tags

tags = {
  terraform_managed = true
}
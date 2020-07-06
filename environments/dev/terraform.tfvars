###
# environment variables
###

#common

environment = "dev"
region      = "eastus"

#virtual_network

address_space = ["10.1.0.0/16"]

#subnet

address_prefix_aks        = ["10.1.1.0/24"]
address_prefix_agw        = ["10.1.2.0/24"]
address_prefix_k8s_master = ["10.1.3.0/24"]
address_prefix_k8s_node   = ["10.1.4.0/24"]
address_prefix_bastion = ["10.0.14.0/24"]


#aks

service_cidr       = "10.1.13.0/24"
dns_service_ip     = "10.1.13.10"
docker_bridge_cidr = "172.17.0.1/16"


#tags

tags = {
  terraform_managed = true
}
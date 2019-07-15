####################
# Pre-Prod Variables
####################


#commmon

environment = "pre-prod"
region      = "eastus"

#network

vnet_address_ranges                    = ["10.1.0.0/16"]
subnet_aks_nodes_address_prefix        = "10.1.0.0/24"
subnet_virtual_node_aci_address_prefix = "10.1.1.0/24"

#aks-cluster

admin_user_name                 = "brettkuhlman"
aks_version                     = "1.12.8"
aks_agent_type                  = "VirtualMachineScaleSets"
aks_agent_count                 = 1
aks_agent_vm_size               = "Standard_B2s"
aks_dns_service_ip              = "10.1.50.10"
aks_docker_bridge_cidr          = "172.17.0.1/16"
aks_service_cidr                = "10.1.50.0/24"
route_address_prefix            = "0.0.0.0/0"
api_server_authorized_ip_ranges = ["10.1.50.0/24", "172.17.0.0/16", "0.0.0.0/0"]

#tags

tags = {}
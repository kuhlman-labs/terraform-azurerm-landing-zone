####################
# Pre-Prod Variables
####################

#commmon
environment = "pre-prod"
region      = "eastus"

#network
vnet_address_ranges = ["10.1.0.0/16"]
subnets_spoke = [
  {
    name        = "aks_nodes"
    subnet_cidr = "10.1.0.0/24"
  },
  {
    name        = "virtual_node_aci"
    subnet_cidr = "10.1.1.0/24"
  },
  {
    name        = "aks_waf"
    subnet_cidr = "10.1.2.0/28"
  }
]

aks_route_address_prefix = "10.1.0.0/23"

#kubernetes
admin_user_name        = "brettkuhlman"
aks_version            = "1.12.8"
aks_agent_type         = "VirtualMachineScaleSets"
aks_agent_count        = 1
aks_agent_vm_size      = "Standard_B2s"
aks_dns_service_ip     = "10.1.50.10"
aks_docker_bridge_cidr = "172.17.0.1/16"
aks_service_cidr       = "10.1.50.0/24"
#api_server_authorized_ip_ranges = ["70.126.29.147/32"]

############################
#Mandatory Tagging Variables
############################
owner_tag         = ""
region_tag        = ""
cost_center_tag   = ""
approver_tag      = ""
service_hours_tag = ""


###########################
#Optional Tagging Variables
###########################
optional_tags = {}
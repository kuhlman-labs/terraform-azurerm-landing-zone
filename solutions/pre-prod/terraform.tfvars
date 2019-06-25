####################
# Pre-Prod Variables
####################

#testing remove later, do not merge in
storage_account_name            = "kuhlmanlabstfstate"
state_key                       = "pre-prod.tfstate"
access_key                      = "x3wWSiL9skUf362EgBBgpHETux+mHFd/ZKJAWkIbYuB6x7k7/9b7W/dSydvitYCq24Uh+hrv4JWwB4z4oUYc9g=="
app_id                          = "5b94ad20-024b-417d-a8e5-9da27e3c2b88"
client_secret                   = "2cd8bccc-b9da-4dc4-9362-86671574aaa2"
shared_services_subscription_id = "0fd6b65c-0ee2-4bb4-957d-1b92fff9d1b4"
subscription_id                 = "0fd6b65c-0ee2-4bb4-957d-1b92fff9d1b4"
tenant_id                       = "4f86b03e-3df6-4d41-b222-9582f9e231cb"

aks_client_id            = "01521c5e-7bed-47df-b89f-19cb344e6388"
aks_server_client_secret = "pEbmEA1XWzDdB*g-?RhvQ7/Y9ti43oeA"
aks_server_id            = "dff1eb98-81e3-4cb9-910c-6ecfa69c822c"
aks_server_object_id     = "1f88650c-a051-47a1-a704-d9ad8844de32"
#testing remove later, do not merge in

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

aks_route_address_prefix = "10.1.0.0/24"

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
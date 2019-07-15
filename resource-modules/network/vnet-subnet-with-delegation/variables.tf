##########################################
# Setting up resource variables for subnet
##########################################

#common

variable "resource_group" {
  description = "Resource Group of vNet"
  type        = string
}

#subnet

variable "vnet_name" {
  description = "The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

variable "subnet_service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql and Microsoft.Storage."
  type        = list
  default     = []
}

variable "delegation_name" {
  description = "A name for this delegation."
  type        = string
  default     = ""
}

variable "service_delegation_name" {
  description = "The name of service to delegate to. Possible values include: Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Logic/integrationServiceEnvironments, Microsoft.Netapp/volumes, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers or Microsoft.Web/serverFarms."
  type        = string
  default     = ""
}

variable "service_delegation_actions" {
  description = "A list of Actions which should be delegated. Possible values include: Microsoft.Network/virtualNetworks/subnets/action."
  type        = list
  default     = []
}

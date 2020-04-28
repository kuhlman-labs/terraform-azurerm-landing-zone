###
# resource variables
###

#common

variable "resource_group" {
  description = "resource Group of vNet"
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
  default     = null
}

variable "delegations" {
  description = "A List of delegation blocks to associate with the subnet."
  type        = list
  default     = []
  /*
  Example:
  [
    {
    delegation_name            = "testdelegation"
    service_delegation_name    = "Microsoft.ContainerInstance/containerGroups"
    service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  ]
*/
}
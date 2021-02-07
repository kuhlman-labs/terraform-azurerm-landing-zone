###
# resource variables
###

#common

variable "resource_group" {
  description = "(Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

#subnet

variable "virtual_network_name" {
  description = "(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "name_prefixes" {
  description = "The name of the subnet. Changing this forces a new resource to be created."
  type        = list(string)
  default     = ["snet"]
}

variable "address_prefixes" {
  description = "(Optional) The address prefixes to use for the subnet."
  type        = list(string)
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql and Microsoft.Storage."
  type        = list(any)
  default     = null
}

variable "enforce_private_link_endpoint_network_policies" {
  description = "(Optional) Enable or Disable network policies for the private link endpoint on the subnet. Default value is false. Conflicts with enforce_private_link_service_network_policies."
  type        = bool
  default     = null
}

variable "enforce_private_link_service_network_policies" {
  description = "(Optional) Enable or Disable network policies for the private link service on the subnet. Default valule is false. Conflicts with enforce_private_link_endpoint_network_policies."
  type        = bool
  default     = null
}

variable "delegation" {
  description = "A List of delegation blocks to associate with the subnet."
  type        = list(any)
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
###
# resource variables
###

#common

variable "resource_group" {
  description = "This is the resource group to which the resources will be deployed"
  type        = string
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "nsg"
}

#nsg

variable "network_security_group_name" {
  description = "(Required) The name of the Network Security Group that we want to attach the rule to. Changing this forces a new resource to be created."
  type = string
}

variable "network_security_rules" {
  description = "List of network security rules"
  type        = list
  default = []
  /* 
  example:
  [
    {
      name                       = "SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "22"
      destination_port_range     = "22"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "RDP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "3389"
      destination_port_range     = "3389"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
  ]
*/
}


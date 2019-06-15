#######################################
# Setting up Resource Variables for NSG
#######################################

variable "resource_group" {
  description = "This is the resource group to which the resources will be deployed"
  type        = string
}

variable "resource_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "nsg"
}

variable "environment" {
  description = "Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab"
  type        = string
}

variable "tier" {
  description = "The tier of a VNet, e.g HUB, or SPK"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets the NSG will apply to"
  type        = list(string)
}

variable "subnet_names" {
  description = "Subnet names the NSG will apply to. Used for count"
  type        = list(string)
}

variable "nsg_rules" {
  description = "List of NSG rules"
  type        = list

  default = [
    {
      name                       = "SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
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
      protocol                   = "Tcp"
      source_port_range          = "3389"
      destination_port_range     = "3389"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
  ]
}


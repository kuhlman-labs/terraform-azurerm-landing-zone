###############################
# Setting up resource variables
###############################

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "resource_prefix" {
  description = "Short prefix to identify resource"
  type        = string
  default     = "app-gw"
}

variable "sku_name" {
  description = "The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2."
  type        = string
}

variable "sku_tier" {
  description = "The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2."
  type        = string
}

variable "sku_capacity" {
  description = "(Required) The Capacity of the SKU to use for this Application Gateway - which must be between 1 and 10, optional if autoscale_configuration is set"
  type        = string
  default     = 1
}

variable "zones" {
  description = "(Optional) A collection of availability zones to spread the Application Gateway over."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The ID of a Subnet."
  type        = string
}

variable "private_ip" {
  description = "(Optional) The Private IP Address to use for the Application Gateway."
  type        = string
  default     = null
}


#tags

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}
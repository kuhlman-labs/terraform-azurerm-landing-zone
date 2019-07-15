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

variable "appgw_vnet_name" {
  description = "Name of the Vnet that the appgw is in"
  type        = string
}

variable "appgw_sku" {
  description = "The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2."
  type        = string

}

variable "appgw_tier" {
  description = "The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2."
  type        = string
}
variable "appgw_subnet_id" {
  description = "The ID of a Subnet."
  type        = string
}










#######################################
#Setting up Optional Tagging Variables
#######################################

variable "tags" {
  description = "Optional tags to be added to resource"
  type        = map
  default     = {}
}
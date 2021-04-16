###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "name_prefix" {
  description = "a short pre-defined text to identify resource type"
  type        = string
  default     = "kv"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#key vault

variable "sku_name" {
  description = "The Name of the sku used for this Key Vault. Possible values are standard and premium."
  type        = string
}

variable "network_acls" {
  description = "(Optional) A network_acls block as defined below."
  type        = list(any)
  default     = []
  /*
A network_acls block supports the following:
bypass                     - (Required) Specifies which traffic can bypass the network rules. Possible values are AzureServices and None.
default_action             - (Required) The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny.
ip_rules                   - (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault.
virtual_network_subnet_ids - (Optional) One or more Subnet ID's which should be able to access this Key Vault.
*/
}

variable "enabled_for_deployment" {
  description = "(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
  type        = bool
  default     = null
}

variable "enabled_for_disk_encryption" {
  description = "(Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
  type        = bool
  default     = null

}

variable "enabled_for_template_deployment" {
  description = "(Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
  type        = bool
  default     = null
}

variable "purge_protection_enabled" {
  description = "(Optional) Is Purge Protection enabled for this Key Vault? Defaults to false."
  type        = bool
  default     = null
}

#Once Soft Delete has been Enabled it's not possible to Disable it.
/*
variable "soft_delete_enabled" {
  description = "(Optional) Should Soft Delete be enabled for this Key Vault? Defaults to false."
  type        = bool
  default     = null
}
*/
#tags

variable "tags" {
  description = "tags to be added to resource"
  type        = map(any)
  default     = {}
}


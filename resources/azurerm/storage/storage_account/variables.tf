###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "st"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#storage account

variable "access_tier" {
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
}

variable "account_kind" {
  description = "(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to StorageV2."
  type        = string
  default     = null
}

variable "account_replication_type" {
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  type        = string
}

variable "account_tier" {
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
}

variable "blob_properties" {
  description = "(Optional) A blob_properties block as defined below."
  type        = list
  default     = []
}

variable "custom_domain" {
  description = "(Optional) A custom_domain block as documented below."
  type        = list
  default     = []
}

variable "enable_https_traffic_only" {
  description = "(Optional) Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true."
  type        = bool
  default     = null
}

variable "identity" {
  description = "(Optional) A identity block as defined below."
  type        = list
  default     = []
}

variable "is_hns_enabled" {
  description = "(Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 (see here for more information). Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "network_rules" {
  description = "(Optional) A network_rules block as documented below."
  type        = list
  default     = []
}

#queue_properties cannot be set when the access_tier is set to BlobStorage
variable "queue_properties" {
  description = "(Optional) A queue_properties block as defined below."
  type        = list
  default     = []
}

#static_website can only be set when the account_kind is set to StorageV2
variable "static_website" {
  description = "(Optional) A static_website block as defined below."
  type        = list
  default     = []
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}
/* -- Compulsory Variables -- */

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "resource_prefix" {
  description = "Prefix that will be used as initial part of the name for the storage account. Must be compatible with storage account naming, i.e. lowercase letters/numbers, no special characters"
  type        = string
  default     = "stor"
}

variable "stor_name" {
  description = "Name of the storage account to create. Will be added to the resource_prefix. Must be lowercase letters/numbers, no special characters. Maximum of 24 characters for prefix + name"
  type        = string
}

/* -- Optional Variables -- */

variable "stor_kind" {
  type        = string
  description = "Type of storage to use, valid inputs include Storage, StorageV2, BlobStorage"
  default     = "StorageV2"
}

variable "stor_tier" {
  type        = string
  default     = "Standard"
  description = "Tier of storage to use, valid inputs include Standard, Premium"
}

variable "stor_blob_encryption" {
  type        = string
  default     = "true"
  description = "Enable/disable encryption for blob storage"
}

variable "stor_file_encryption" {
  type        = string
  default     = "true"
  description = "Enable/disable encryption for file storage"
}

variable "stor_replication" {
  description = "Replication type to use, valid inputs include LRS, GRS, RAGRS, ZRS"
  default     = "LRS"
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
  default     = "Hot"
}

#######################################
#Setting up Mandatory Tagging Variables
#######################################

variable "owner_tag" {
  description = "APP/Technical; Email address of App/Product Owner"
  type        = string
}

variable "region_tag" {
  description = "Financial; i.e. Sharepoint Global"
  type        = string
}

variable "cost_center_tag" {
  description = "Financial; Unique - Code provided directly from Finance (BU/Brand)"
  type        = string
}

variable "approver_tag" {
  description = "Financial; Unique - email address"
  type        = string
}

variable "service_hours_tag" {
  description = "Automation/Security; Sort -FullTime\\|Weekdays..."
  type        = string
}

variable "cloudreach_ops_tag" {
  description = "Automation/Security; Reserved for Cloudreach Ops"
  type        = string
}

#######################################
#Setting up Optional Tagging Variables
#######################################
variable "optional_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}


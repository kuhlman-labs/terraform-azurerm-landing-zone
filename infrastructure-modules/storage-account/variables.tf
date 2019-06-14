###############################
# Setting up Resource Variables
###############################
variable "resource_prefix" {
  description = "Prefix that will be used as initial part of the name for resource group and storage account, must be compatible with storage account naming, i.e. lowercase letters/numbers, no special characters"

  type    = "string"
  default = "stor"
}

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = "string"
}

variable "environment" {
  description = "Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab"
  type        = "string"
}

variable "stor_name" {
  description = "Name of the storage account to create. Will be added the resource_prefix. must be lowercase letters/numbers, no special characters maximum of 24 characters for prefix + name"
  type        = "string"
}

variable "stor_kind" {
  type        = "string"
  description = "Type of storage to use, valid inputs include Storage, StorageV2, BlobStorage"
  default     = "StorageV2"
}

variable "stor_tier" {
  type        = "string"
  default     = "Standard"
  description = "Tier of storage to use, valid inputs include Standard, Premium"
}

variable "stor_blob_encryption" {
  type        = "string"
  default     = "true"
  description = "Enable/disable encryption for blob storage"
}

variable "stor_file_encryption" {
  type        = "string"
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
  type        = "string"
}

variable "region_tag" {
  description = "Financial; i.e. Sharepoint Global"
  type        = "string"
}

variable "cost_center_tag" {
  description = "Financial; Unique - Code provided directly from Finance (BU/Brand)"
  type        = "string"
}

variable "approver_tag" {
  description = "Financial; Unique - email address"
  type        = "string"
}

variable "service_hours_tag" {
  description = "Automation/Security; Sort -FullTime\\|Weekdays..."
  type        = "string"
}

variable "cloudreach_ops_tag" {
  description = "Automation/Security; Reserved for Cloudreach Ops"
  type        = "string"
}

#######################################
#Setting up Optional Tagging Variables
#######################################

variable "optional_tags" {
  description = "Optional tags to be added to resource"
  type        = "map"
  default     = {}
}

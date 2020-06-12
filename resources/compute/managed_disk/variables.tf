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
  default     = "disk"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#managed disk

variable "create_option" {
  description = "(Required) The method to use when creating the managed disk. Changing this forces a new resource to be created.Possible values include:Import,Empty,Copy,FromImage,Restore"
  type        = string
}

variable "disk_count" {
  description = "(Optional) number of VMs to create"
  type        = number
  default     = 1
}

#The Disk Encryption Set must have the Reader Role Assignment scoped on the Key Vault - in addition to an Access Policy to the Key Vault
variable "disk_encryption_set_id" {
  description = "(Optional) The ID of a Disk Encryption Set which should be used to encrypt this Managed Disk. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "disk_iops_read_write" {
  description = "(Optional) The number of IOPS allowed for this disk; only settable for UltraSSD disks. One operation can transfer between 4k and 256k bytes."
  type        = string
  default     = null
}

variable "disk_size_gb" {
  description = "(Optional, Required for a new managed disk) Specifies the size of the managed disk to create in gigabytes. If create_option is Copy or FromImage, then the value must be equal to or greater than the source's size."
  type        = string
  default     = null
}

variable "encryption_settings" {
  description = "(Optional) A encryption_settings block as defined below."
  type        = list
  default     = []
}

variable "image_reference_id" {
  description = "(Optional) ID of an existing platform/marketplace disk image to copy when create_option is FromImage."
  type        = string
  default     = null
}

variable "os_type" {
  description = "(Optional) Specify a value when the source of an Import or Copy operation targets a source that contains an operating system. Valid values are Linux or Windows."
  type        = string
  default     = null
}

variable "source_resource_id" {
  description = "(Optional) The ID of an existing Managed Disk to copy create_option is Copy or the recovery point to restore when create_option is Restore"
  type        = string
  default     = null
}

variable "source_uri" {
  description = "(Optional) URI to a valid VHD file to be used when create_option is Import."
  type        = string
  default     = null
}

variable "storage_account_id" {
  description = "(Optional) The ID of the Storage Account where the source_uri is located. Required when create_option is set to Import. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "storage_account_type" {
  description = "(Required) The type of storage to use for the managed disk. Possible values are Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS."
  type        = string
}

variable "enable_zones" {
  description = "(Optional) Enable zone deployment for this Virtual Machine."
  type        = bool
  default     = false
}

variable "zones" {
  description = "(Optional) A collection containing the availability zone to allocate the Managed Disk in."
  type        = list
  default     = null
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}
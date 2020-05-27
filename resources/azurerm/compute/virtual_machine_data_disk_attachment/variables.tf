###
# resource variables
###

variable "managed_disk_id" {
  description = "(Required) The ID of an existing Managed Disk which should be attached. Changing this forces a new resource to be created."
  type        = string
}

variable "virtual_machine_id" {
  description = "(Required) The ID of the Virtual Machine to which the Data Disk should be attached. Changing this forces a new resource to be created."
  type        = string
}

variable "lun" {
  description = "(Required) The Logical Unit Number of the Data Disk, which needs to be unique within the Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "caching" {
  description = "(Required) Specifies the caching requirements for this Data Disk. Possible values include None, ReadOnly and ReadWrite."
  type        = string
}

variable "create_option" {
  description = "(Optional) The Create Option of the Data Disk, such as Empty or Attach. Defaults to Attach. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "write_accelerator_enabled" {
  description = "(Optional) Specifies if Write Accelerator is enabled on the disk. This can only be enabled on Premium_LRS managed disks with no caching and M-Series VMs. Defaults to false."
  type        = bool
  default     = null
}
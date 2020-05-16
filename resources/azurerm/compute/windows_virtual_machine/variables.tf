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
  default     = "wvm"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#windows virtual machine

variable "additional_capabilities" {
  description = "(Optional) A additional_capabilities block as defined below."
  type        = list
  default     = []
}

variable "additional_unattend_content" {
  description = "(Optional) One or more additional_unattend_content blocks as defined below. Changing this forces a new resource to be created."
  type        = list
  default     = []
}

variable "admin_password" {
  description = "(Required) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "admin_username" {
  description = "(Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "allow_extension_operations" {
  description = "(Optional) Should Extension Operations be allowed on this Virtual Machine? Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "availability_set_id" {
  description = "(Optional) Specifies the ID of the Availability Set in which the Virtual Machine should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "computer_name" {
  description = "(Optional) Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name, then you must specify computer_name. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "custom_data" {
  description = "(Optional) The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "dedicated_host_id" {
  description = "(Optional) The ID of a Dedicated Host where this machine should be run on. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "enable_automatic_updates" {
  description = "(Optional) Specifies if Automatic Updates are Enabled for the Windows Virtual Machine. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "eviction_policy" {
  description = "(Optional) Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. At this time the only supported value is Deallocate. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "identity" {
  description = "(Optional) An identity block as defined below."
  type        = list
  default     = []
}

variable "license_type" {
  description = "(Optional) Specifies the type of on-premise license (also known as Azure Hybrid Use Benefit) which should be used for this Virtual Machine. Possible values are None, Windows_Client and Windows_Server. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "max_bid_price" {
  description = "(Optional) The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction_policy. Defaults to -1, which means that the Virtual Machine should not be evicted for price reasons."
  type        = number
  default     = null
}

variable "network_interface_ids" {
  description = "(Required). A list of Network Interface ID's which should be attached to this Virtual Machine. The first Network Interface ID in this list will be the Primary Network Interface on the Virtual Machine."
  type        = list
}

variable "os_disk_caching" {
  description = "(Required) The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
  type        = string
}

variable "os_disk_encryption_set_id" {
  description = "(Optional) The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk."
  type        = string
  default     = null
}

variable "os_disk_size_gb" {
  description = "(Optional) The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from."
  type        = number
  default     = null
}

variable "os_disk_storage_account_type" {
  description = "(Required) The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS. Changing this forces a new resource to be created."
  type        = string
}

variable "os_disk_write_accelerator_enabled" {
  description = "(Optional) Should Write Accelerator be Enabled for this OS Disk? Defaults to false."
  type        = bool
  default     = null
}

variable "plan" {
  description = "(Optional) A plan block as defined below. Changing this forces a new resource to be created."
  type        = list
  default     = []
}

variable "priority" {
  description = "(Optional) Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "provision_vm_agent" {
  description = "(Optional) Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "proximity_placement_group_id" {
  description = "(Optional) The ID of the Proximity Placement Group which the Virtual Machine should be assigned to. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "secret" {
  description = "(Optional) One or more secret blocks as defined below."
  type        = list
  default     = []
}

variable "size" {
  description = "(Required) The SKU which should be used for this Virtual Machine, such as Standard_F2."
  type        = string
}

variable "source_image_id" {
  description = "(Optional) The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "source_image_reference_offer" {
  description = "offer type, ex. WindowsServer"
  type        = string
}

variable "source_image_reference_publisher" {
  description = "publisher type, ex. MicrosoftWindowsServer"
  type        = string
}

variable "source_image_reference_sku" {
  description = "sku type, ex. 2016-Datacenter"
  type        = string
}

variable "source_image_reference_version" {
  description = "version type, ex. latest"
  type        = string
}

variable "storage_account_uri" {
  description = "(Required) The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor."
  type        = string
}

variable "timezone" {
  description = "(Optional) Specifies the Time Zone which should be used by the Virtual Machine, the possible values are defined here."
  type        = string
  default     = null
}

variable "vm_count" {
  description = "(Optional) number of VMs to create"
  type        = number
  default     = 1
}

variable "winrm_listener" {
  description = "(Optional) One or more winrm_listener blocks as defined below."
  type        = list
  default     = []
}

variable "zone" {
  description = "(Optional) The Zone in which this Virtual Machine should be created. Changing this forces a new resource to be created."
  type        = number
  default     = null
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map
  default     = {}
}
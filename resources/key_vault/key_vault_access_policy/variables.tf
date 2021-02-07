###
# resource variables
###

#key vault access policy

variable "key_vault_id" {
  description = "(Required) Specifies the id of the Key Vault resource. Changing this forces a new resource to be created."
  type        = string
}

variable "object_id" {
  description = "(Required) The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created."
  type        = string
}

variable "application_id" {
  description = "(Optional) The object ID of an Application in Azure Active Directory."
  type        = string
  default     = null
}

variable "certificate_permissions" {
  description = "(Optional) List of certificate permissions, must be one or more from the following: backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update."
  type        = list(any)
  default     = null
}

variable "key_permissions" {
  description = "(Required) List of key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey."
  type        = list(any)
}

variable "secret_permissions" {
  description = "(Required) List of secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set."
  type        = list(any)
}

variable "storage_permissions" {
  description = "(Optional) List of storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update."
  type        = list(any)
  default     = null
}
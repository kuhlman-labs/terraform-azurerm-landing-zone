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
  default     = "key-vault"
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#key vault

variable "sku_name" {
  description = "The Name of the sku used for this Key Vault. Possible values are standard and premium."
  type        = string
  default     = "standard"
}

variable "access_policy" {
  description = ""
  type        = list
  default = [
    {
      certificate_permissions = [
        "create",
        "delete",
        "deleteissuers",
        "get",
        "getissuers",
        "import",
        "list",
        "listissuers",
        "managecontacts",
        "manageissuers",
        "setissuers",
        "update",
      ]
      key_permissions = [
        "backup",
        "create",
        "decrypt",
        "delete",
        "encrypt",
        "get",
        "import",
        "list",
        "purge",
        "recover",
        "restore",
        "sign",
        "unwrapKey",
        "update",
        "verify",
        "wrapKey",
      ]
      secret_permissions = [
        "backup",
        "delete",
        "get",
        "list",
        "purge",
        "recover",
        "restore",
        "set",
      ]
    }
  ]

}

/*
variable "certificate_permissions" {
  description = "(Optional) List of certificate permissions, must be one or more from the following: backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update."
  type        = list
  default = [
    "create",
    "delete",
    "deleteissuers",
    "get",
    "getissuers",
    "import",
    "list",
    "listissuers",
    "managecontacts",
    "manageissuers",
    "setissuers",
    "update",
  ]
}

variable "key_permissions" {
  description = "(Optional) List of key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey."
  type        = list
  default = [
    "backup",
    "create",
    "decrypt",
    "delete",
    "encrypt",
    "get",
    "import",
    "list",
    "purge",
    "recover",
    "restore",
    "sign",
    "unwrapKey",
    "update",
    "verify",
    "wrapKey",
  ]
}

variable "secret_permissions" {
  description = "(Optional) List of secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set."
  type        = list
  default = [
    "backup",
    "delete",
    "get",
    "list",
    "purge",
    "recover",
    "restore",
    "set",
  ]

}
*/

#tags

variable "tags" {
  description = "tags to be added to resource"
  type        = map
  default     = {}
}


###
# resource variables
###

#key-vault

variable "key_vault_id" {
  description = "ID for the Key Vault that the certificate will be generated in"
  type        = string
}

variable "certificate_name" {
  description = " (Required) Specifies the name of the Key Vault Certificate. Changing this forces a new resource to be created."
  type        = string
  default     = "imported-cert"
}

variable "certificate_contents" {
  description = "The base64-encoded certificate contents. Changing this forces a new resource to be created."
  type        = string
}

variable "certificate_password" {
  description = "The password associated with the certificate. Changing this forces a new resource to be created."
  type        = string
}

variable "issuer_name" {
  description = "(Required) The name of the Certificate Issuer. Possible values include Self, or the name of a certificate issuing authority supported by Azure. Changing this forces a new resource to be created."
  type        = string
  default     = "Self"
}

variable "key_exportable" {
  description = "(Required) Is this Certificate Exportable? Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "key_size" {
  description = "(Required) The size of the Key used in the Certificate. Possible values include 2048 and 4096. Changing this forces a new resource to be created."
  type        = string
  default     = "2048"
}

variable "key_type" {
  description = "(Required) Specifies the Type of Key, such as RSA. Changing this forces a new resource to be created."
  type        = string
  default     = "RSA"
}

variable "key_reuse" {
  description = "(Required) Is the key reusable? Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "secret_content_type" {
  description = "(Required) The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM. Changing this forces a new resource to be created."
  type        = string
  default     = "application/x-pkcs12"
}


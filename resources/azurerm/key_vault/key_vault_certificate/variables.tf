###
# resource variables
###

#key vault certificate

variable "key_vault_id" {
  description = "ID for the Key Vault that the certificate will be generated in"
  type        = string
}

variable "certificate_name" {
  description = " (Required) Specifies the name of the Key Vault Certificate. Changing this forces a new resource to be created."
  type        = string
}

variable "certificate" {
  description = "(Optional) A certificate block as defined below, used to Import an existing certificate."
  type        = list
  default     = []
  /*
certificate supports the following:
contents - (Required) The base64-encoded certificate contents. Changing this forces a new resource to be created.
password - (Optional) The password associated with the certificate. Changing this forces a new resource to be created.
  */
}

variable "issuer_name" {
  description = "(Required) The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown (for a certificate issuing authority like Let's Encrypt and Azure direct supported ones). Changing this forces a new resource to be created."
  type        = string
  default     = "Self"
}

variable "exportable" {
  description = "(Required) Is this Certificate Exportable? Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "key_size" {
  description = "(Required) The size of the Key used in the Certificate. Possible values include 2048 and 4096. Changing this forces a new resource to be created."
  type        = string
}

variable "key_type" {
  description = "(Required) Specifies the Type of Key, such as RSA. Changing this forces a new resource to be created."
  type        = string
}

variable "reuse" {
  description = "(Required) Is the key reusable? Changing this forces a new resource to be created."
  type        = bool
}

variable "content_type" {
  description = "(Required) The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM. Changing this forces a new resource to be created."
  type        = string
}

variable "action_type" {
  description = "(Required) The Type of action to be performed when the lifetime trigger is triggerec. Possible values include AutoRenew and EmailContacts. Changing this forces a new resource to be created."
  type        = string
}

variable "lifetime_percentage" {
  description = "(Optional) The percentage at which during the Certificates Lifetime the action associated with this Trigger should run. Changing this forces a new resource to be created. Conflicts with days_before_expiry."
  type        = number
  default     = null
}

variable "days_before_expiry" {
  description = "(Optional) The number of days before the Certificate expires that the action associated with this Trigger should run. Changing this forces a new resource to be created. Conflicts with lifetime_percentage."
  type        = number
  default     = 60
}

variable "extended_key_usage" {
  description = "(Optional) A list of Extended/Enhanced Key Usages. Changing this forces a new resource to be created."
  type        = list
  default     = []
}

variable "key_usage" {
  description = "(Required) A list of uses associated with this Key. Possible values include cRLSign, dataEncipherment, decipherOnly, digitalSignature, encipherOnly, keyAgreement, keyCertSign, keyEncipherment and nonRepudiation and are case-sensitive. Changing this forces a new resource to be created."
  type        = list
}

variable "subject" {
  description = "(Required) The Certificate's Subject. Changing this forces a new resource to be created."
  type        = string
}

variable "dns_names" {
  description = "(Optional) A list of alternative DNS names (FQDNs) identified by the Certificate. Changing this forces a new resource to be created."
  type        = list
  default     = []
}

variable "emails" {
  description = "(Optional) A list of email addresses identified by this Certificate. Changing this forces a new resource to be created."
  type        = list
  default     = []
}

variable "upns" {
  description = "(Optional) A list of User Principal Names identified by the Certificate. Changing this forces a new resource to be created."
  type        = list
  default     = []
}

variable "validity_in_months" {
  description = "(Required) The Certificates Validity Period in Months. Changing this forces a new resource to be created."
  type        = number
}
#tags

variable "tags" {
  description = "tags to be added to resource"
  type        = map
  default     = {}
}




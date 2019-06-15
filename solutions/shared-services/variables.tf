########################################
# Shared Services Variables
########################################
variable "subscription_id" {
  description = "The Id of the Subscription that should contain the created resources"
  type        = string
}

variable "app_id" {
  description = "The client ID for the Service Principal"
  type        = string
}

variable "client_secret" {
  description = "The secret for the Service Principal authentication"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID for the Service Principal"
  type        = string
}

variable "environment" {
  description = "Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab"
  type        = string
}

variable "region" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list(string)
}

variable "subnets_hub" {
  description = "Map of subnets with name, subnet_cidr, and service_endpoints."
  type        = list(string)
}

variable "nsg_rules" {
  description = "List of NSG rules"
  type        = list(string)
}

variable "client_address_spaces" {
  description = "The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation"
  type        = list(string)
}

variable "vpn_client_protocols" {
  description = "List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN."
  type        = list(string)
}

/* -- Diagnostic Store Optional Variables -- */
variable "diag_acc_prefix" {
  description = "Prefix to be used for the shared services diagnostic storage account name. Must be compatible with Azure storage account naming, only lowercase letters and numbers"
  type        = string
  default     = "sshubinfdiag"
}

variable "diag_kind" {
  type        = string
  description = "Type of storage to use, valid inputs include Storage, StorageV2, BlobStorage"
  default     = "StorageV2"
}

variable "diag_tier" {
  type        = string
  default     = "Standard"
  description = "Tier of storage to use, valid inputs include Standard, Premium"
}

variable "diag_blob_encryption" {
  type        = string
  default     = "true"
  description = "Enable/disable encryption for blob storage"
}

variable "diag_file_encryption" {
  type        = string
  default     = "true"
  description = "Enable/disable encryption for file storage"
}

variable "diag_replication" {
  description = "Replication type to use, valid inputs include LRS, GRS, RAGRS, ZRS"
  default     = "LRS"
}

variable "diag_access_tier" {
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


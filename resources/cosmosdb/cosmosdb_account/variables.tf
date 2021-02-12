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
  default     = "cosmos"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#cosmosdb_account

variable "offer_type" {
  description = "(Required) Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard."
  type        = string
  default     = "Standard"
}

variable "kind" {
  description = "(Optional) Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB and MongoDB. Defaults to GlobalDocumentDB. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "enable_free_tier" {
  description = "(Optional) Enable Free Tier pricing option for this Cosmos DB account. Defaults to false. Changing this forces a new resource to be created."
  type        = bool
  default     = null 
}

variable "consistency_level" {
  description = "(Required) The Consistency Level to use for this CosmosDB Account - can be either BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix."
  type        = string
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}
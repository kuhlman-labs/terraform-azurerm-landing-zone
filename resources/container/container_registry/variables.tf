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
  default     = "acr"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#container registry

variable "admin_enabled" {
  description = "(Optional) Specifies whether the admin user is enabled. Defaults to false."
  type        = bool
  default     = null
}

variable "sku" {
  description = "(Optional) The SKU name of the container registry. Possible values are Basic, Standard and Premium. Classic (which was previously Basic) is supported only for existing resources."
  type        = string
  default     = null
}

#The georeplication_locations is only supported on new resources with the Premium SKU.
variable "georeplication_locations" {
  description = "(Optional) A list of Azure locations where the container registry should be geo-replicated."
  type        = list(any)
  default     = null
}

#network_rule_set is only supported with the Premium SKU at this time.
variable "network_rule_set" {
  description = "(Optional) A network_rule_set block as documented below."
  type        = list(any)
  default     = []
  /*
network_rule_set supports the following:
default_action - (Optional) The behaviour for requests matching no rules. Either Allow or Deny. Defaults to Allow
ip_rule - (Optional) One or more ip_rule blocks as defined below.
virtual_network - (Optional) One or more virtual_network blocks as defined below.
ip_rule supports the following:
action - (Required) The behaviour for requests matching this rule. At this time the only supported value is Allow
ip_range - (Required) The CIDR block from which requests will match the rule.
virtual_network supports the following:
action - (Required) The behaviour for requests matching this rule. At this time the only supported value is Allow
subnet_id - (Required) The subnet id from which requests will match the rule.
*/
}

#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}


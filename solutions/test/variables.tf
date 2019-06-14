########################################
# Variables
########################################
variable "subscription_id" {
  description = "The Id of the Subscription that should contain the created resources"
  type        = "string"
}

variable "app_id" {
  description = "The client ID for the Service Principal"
  type        = "string"
}

variable "client_secret" {
  description = "The secret for the Service Principal authentication"
  type        = "string"
}

variable "tenant_id" {
  description = "The tenant ID for the Service Principal"
  type        = "string"
}

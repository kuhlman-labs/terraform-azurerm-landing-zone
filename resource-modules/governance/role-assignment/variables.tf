variable "role_definition_name" {
  description = " The name of a built-in Role. Changing this forces a new resource to be created."
  type        = string
}

variable "scope" {
  description = "The scope at which the Role Assignment applies too, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM. Changing this forces a new resource to be created."
  type        = string
}

variable "principal_id" {
  description = "The ID of the Principal (User, Group, Service Principal, or Application) to assign the Role Definition to. Changing this forces a new resource to be created."
  type        = string
}

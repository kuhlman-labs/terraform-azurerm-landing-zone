
# Module `resources/azure/governance/role-assignment`

Core Version Constraints:
* `>= 0.12`

Provider Requirements:
* **azurerm:** `~> 1.32.0`

## Input Variables
* `principal_id` (required): The ID of the Principal (User, Group, Service Principal, or Application) to assign the Role Definition to. Changing this forces a new resource to be created.
* `role_definition_name` (required):  The name of a built-in Role. Changing this forces a new resource to be created.
* `scope` (required): The scope at which the Role Assignment applies too, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM. Changing this forces a new resource to be created.

## Output Values
* `role_assignment_id`

## Managed Resources
* `azurerm_role_assignment.base` from `azurerm`


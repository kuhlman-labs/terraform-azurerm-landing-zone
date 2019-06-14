### Variables Parse from InputConfig-RBAC.xml
[xml]$ConfigFile = Get-Content -Path .\InputConfig-RBAC.xml

### Input Variables From InputConfig-RBAC.xml
$Subscription01 = $ConfigFile.Config.Subscription01
$Subscription02 = $ConfigFile.Config.Subscription02
$Subscription03 = $ConfigFile.Config.Subscription03
$Subscription04 = $ConfigFile.Config.Subscription04
$Subscription05 = $ConfigFile.Config.Subscription05

### Pulling Subscription ID for Variable
$Subscription01ID = (Get-AzSubscription -SubscriptionName $Subscription01).Id
$Subscription02ID = (Get-AzSubscription -SubscriptionName $Subscription02).Id
$Subscription03ID = (Get-AzSubscription -SubscriptionName $Subscription03).Id
$Subscription04ID = (Get-AzSubscription -SubscriptionName $Subscription04).Id
$Subscription05ID = (Get-AzSubscription -SubscriptionName $Subscription05).Id

### Virtual Machine Administrator
$role = Get-AzRoleDefinition "Virtual Machine Contributor"  ## Starting with an existing Role Definition 
$role.Id = $null
$role.Name = "Virtual Machine Administrator"
$role.Description = "Can monitor and restart virtual machines."
$role.Actions.Clear()
$role.Actions.Add("Microsoft.Storage/*/read")
$role.Actions.Add("Microsoft.Network/*/read")
$role.Actions.Add("Microsoft.Compute/*/read")
$role.Actions.Add("Microsoft.Compute/virtualMachines/start/action")
$role.Actions.Add("Microsoft.Compute/virtualMachines/restart/action")
$role.Actions.Add("Microsoft.Authorization/*/read")
$role.Actions.Add("Microsoft.ResourceHealth/availabilityStatuses/read")
$role.Actions.Add("Microsoft.Resources/subscriptions/resourceGroups/read")
$role.Actions.Add("Microsoft.Insights/alertRules/*")
$role.Actions.Add("Microsoft.Support/*")
#Clears Scope Assignments
$role.AssignableScopes.Clear()
#Adding Assignments to All Subscriptions.  Comment out any that are not needed
$role.AssignableScopes.Add("/subscriptions/$Subscription01ID")
$role.AssignableScopes.Add("/subscriptions/$Subscription02ID")
$role.AssignableScopes.Add("/subscriptions/$Subscription03ID")
$role.AssignableScopes.Add("/subscriptions/$Subscription04ID")
$role.AssignableScopes.Add("/subscriptions/$Subscription05ID")
New-AzRoleDefinition -Role $role

### Network Super Admin
$role = Get-AzRoleDefinition "Network Contributor"  ## Starting with an existing Role Definition 
$role.Id = $null
$role.Name = "Network Administrator"
$role.Description = "Can monitor and restart virtual machines."
$role.Actions.Clear()
$role.Actions.Add("Microsoft.Network/*")
$role.Actions.Add("Microsoft.Support/*")
#Clears Scope Assignments
$role.AssignableScopes.Clear()
#Adding Assignments to All Subscriptions.  Comment out any that are not needed
$role.AssignableScopes.Add("/subscriptions/$Subscription01ID")
$role.AssignableScopes.Add("/subscriptions/$Subscription02ID")
$role.AssignableScopes.Add("/subscriptions/$Subscription03ID")
$role.AssignableScopes.Add("/subscriptions/$Subscription04ID")
$role.AssignableScopes.Add("/subscriptions/$Subscription05ID")
New-AzRoleDefinition -Role $role


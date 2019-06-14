### Variables Parse from InputConfig-RBAC.xml
[xml]$ConfigFile = Get-Content -Path .\InputConfig.xml

### Input Variables From InputConfig-RBAC.xml

# Note: The first Subscription is currently the Audit subscription and it is assigned to the root by default
$Subscription02 = $ConfigFile.Config.Subscription02 
$Subscription03 = $ConfigFile.Config.Subscription03
$Subscription04 = $ConfigFile.Config.Subscription04

$ManagementGroupName01 = $ConfigFile.Config.ManagementGroup01
$ManagementGroupName02 = $ConfigFile.Config.ManagementGroup02

### Pulling Subscription ID for Variable

$Subscription02ID = (Get-AzSubscription -SubscriptionName $Subscription02).Id
$Subscription03ID = (Get-AzSubscription -SubscriptionName $Subscription03).Id
$Subscription04ID = (Get-AzSubscription -SubscriptionName $Subscription04).Id

### Create Management Groups - Production & Non Production * Upon the first creation of a management group, it will automatically create the Root Tenant Group (Root)

New-AzManagementGroup -GroupName $ManagementGroupName01
New-AzManagementGroup -GroupName $ManagementGroupName02

### Note: If you want to put a Management Group within another, as a child to parent
### New-AzManagementGroup -GroupName 'ContosoSubGroup' -ParentId $parentGroup.id

### Adding Subscriptions to Managed Group

New-AzManagementGroupSubscription -GroupName $ManagementGroupName01 -SubscriptionId $Subscription02ID   ## Shared Services
New-AzManagementGroupSubscription -GroupName $ManagementGroupName01 -SubscriptionId $Subscription03ID   ## Production
New-AzManagementGroupSubscription -GroupName $ManagementGroupName02 -SubscriptionId $Subscription04ID   ## Non Production









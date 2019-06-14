## Governance - PowerShell: Management Groups & Custom Roles

### Description
The referenced PS scripts automate the creation of Azure management groups & two customized roles. The only inputs needed are the names of the Subscriptions in the `InputConfig-RBAC.xml` if they differentiate from the default naming conventions. The PowerShell scripts reference this file and must be in the same working directory.

**Note:** You must have an active Azure PowerShell session previously opened and authenticated using `Connect-AzAccount`.

*  `ManagementGroups.ps1` - Creates management groups and moves subscriptions into these management groups
*  `CustomRoles.ps1` - Creates 2 custom roles

### Resources Created

#### Management Groups

To move the subscription into a management group, all of the following RBAC permissions need to be true:

*  `Owner` role on the child subscription.
*  `Owner`, `Contributor`, or `Management Group Contributor` role on the target parent management group.
*  `Owner`, `Contributor`, or `Management Group Contributor` role on the existing parent management group.

The resulting management groups and their associated subscriptions:

*  Root Management Group
    *  Subscriptions:
        * Audit
    *  Production Management Group
        *  Subscriptions: 
            *  Shared Services
            *  Production
    *  Non-Production Management Group
        *  Subscriptions:
            *  Pre-prod

#### Custom Roles

The `CustomeRoles.ps1` script creates two custom roles that extend existing role definitions. 

**Note:** These are here for reference and can be expanded upon with additional permissions and subscription scopes.

Custom roles created:

*  Advanced Virtual Machine Admin
*  Advanced Network Admin





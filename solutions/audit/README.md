# **Solution: Audit**

## Description

This solution creates a log analytics workspace designed to ingest the audit logs for each of the Subscriptions used in the environment.

**Note:** The subscriptions are not automatically tied to the Log Analytics Workspace but need to be configured to send activity logs to the created workspace. The [Microsoft documentation](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/activity-log-collect#connect-to-log-analytics-workspace) should be referenced for steps.

## Resources

### Infrastructure Modules

Solutions are built by calling infrastructure modules that compose the lower level resource modules into a useable and repeatable portion of the infrastructure. Below are the listed infrastructure modules and the resources that are created as a result of their application.

| Type     | Module     |
|----------|------------|
| Log Analytics | [log-analytics](../../infrastructure-modules/log-analytics) |

### Resources Created

| Type     | Resource Module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Log Analytics Workspace | [governance/log-analytics](../../resource-modules/governance/log-analytics/README.md)|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| subscription\_id | The Id of the Subscription that should contain the created resources | string | n/a | yes |
| app\_id | The client ID for the Service Principal | string | n/a | yes |
| client\_secret | The secret for the Service Principal authentication | string | n/a | yes |
| tenant\_id | The tenant ID for the Service Principal | string | n/a | yes |
| environment | Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab | string | n/a | yes |
| region | Geographic region resource will be deployed into | string | n/a | yes |
| owner\_tag | APP/Technical; Email address of App/Product Owner | string | n/a | yes |
| region\_tag | Financial; i.e. Sharepoint Global | string | n/a | yes |
| cost\_center\_tag | Financial; Unique - Code provided directly from Finance (BU/Brand) | string | n/a | yes |
| approver\_tag | Financial; Unique - email address | string | n/a | yes |
| service\_hours\_tag | Automation/Security; Sort -FullTime\|Weekdays... | string | n/a | yes |
| cloudreach\_ops\_tag | Automation/Security; Reserved for Cloudreach Ops | string | n/a | yes |
| optional\_tags | A map of tags to add to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| log\_analytics\_id | Log Analytics Workspace id |
| log\_analytics\_primary\_shared\_key | Primary shared key for the Log Analytics Workspace |
| log\_analytics\_workspace\_id | Workspace (or Customer) ID for the Log Analytics Workspace |


# **Solution: Audit**

## Description

This solution creates a log analytics workspace designed to ingest the audit logs for each of the Subscriptions used in the environment.

**Note:** The subscriptions are not automatically tied to the Log Analytics Workspace but need to be configured to send activity logs to the created workspace. The [Microsoft documentation](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/activity-log-collect#connect-to-log-analytics-workspace) should be referenced for steps.

## Resources

### Infrastructure Modules

Solutions are built by calling infrastructure modules that compose the lower level resource modules into a useable and repeatable portion of the infrastructure. Below are the listed infrastructure modules and the resources that are created as a result of their application.

| Type     | Module     |
|----------|------------|
| Log Analytics | [log-analytics](../../modules/azure/log-analytics) |

### Resources Created

| Type     | Resource Module     |
|----------|------------|
| Resource Group | [resource-group](../../resources/azure/resource-group/README.md)|
| Log Analytics Workspace | [governance/log-analytics](../../resources/azure/governance/log-analytics/README.md)|


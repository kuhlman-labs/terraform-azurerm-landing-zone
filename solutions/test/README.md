# **Solution: test**

## Description

This solution can be used to test that your Service Principal and Subscription settings have been set up properly before executing the deployment of additional solutions.

**Note:** this will verify the basic settings passed in through exporting environment variables. There are solution specific settings that may need to be set. See the solution specific documentation for additional inputs.

## Resources created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| subscription\_id | The Id of the Subscription that should contain the created resources | string | n/a | yes |
| app\_id | The client ID for the Service Principal | string | n/a | yes |
| client\_secret | The secret for the Service Principal authentication | string | n/a | yes |
| tenant\_id | The tenant ID for the Service Principal | string | n/a | yes |


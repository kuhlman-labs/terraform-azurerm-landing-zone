# **Resource Modules: Resource Group**

## Description

This TF module creates a resource group with the name derived from the input variables and then converted to upper case.

## Resources Created

- Resource Group

## Example Variables
```javascript
  resource_prefix = "vnet"
  region          = "westeurope"
  environment     = "p"
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_prefix | A short pre-defined text to identify the resource type | string | n/a | yes |
| region | Geographic region resource will be deployed into | string | n/a | yes |
| environment | Development environment for resource; p: Production, q: Quality and Assurance, s: Staging, d: Development or Lab | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| resource\_group\_name | Generated resource group name |


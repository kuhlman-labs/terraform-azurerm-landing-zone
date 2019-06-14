# **Resource Modules: Log Analytics**

## Description

This TF module creates a Log Analytics Workspace in the provided resource group.

## Resources created

- Key Vault

## Example Variables
```javascript

  environment = "p"
  region      = "eastus"
  tenant_id   = "${var.tenant_id}"
  object_id   = "${var.app_id}"
```


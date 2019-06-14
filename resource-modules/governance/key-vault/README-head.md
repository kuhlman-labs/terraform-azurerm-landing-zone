# **Resource Modules: Key Vault**

## Description

This TF module creates a key vault with a default access policy granting the executing user access to the vault. The name of the vault is generated to make sure that it is global unique.

## Resources created

- Key Vault

## Example Variables
```javascript

  environment = "p"
  region      = "eastus"
  tenant_id   = "${var.tenant_id}"
  object_id   = "${var.app_id}"
```


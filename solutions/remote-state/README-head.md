# **Solution: remote-state**

## Description

This solution allows for creation of the necessary storage account for the azurerm backend.

**Note:** This solution is designed to be executed before all others and the terraform state will be stored on the environment that the Terraform commands are executed.

## Resources created

| Type     | Resource Module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Storage Account | [storage/storage-account](../../resource-modules/storage/storage-account/README.md)|

## Execution

### Steps

 1. Populate terraform.tfvars with the targeted region. 
 2. If you have not already created a Service Principal and exported the necessary environment variables then the main README can be referenced for steps to create one.
 3. Execute Terraform commands, outlined below, in the `solutions/remote-state` directory.
 4. Take the terraform_state_primary_shared_key from output and export `ACCESS_KEY` environment variable in the environment in which the solutions will be applied.
 5. Take the terraform_state_storage_account_name from output and update the `STORAGE_ACCOUNT_NAME` environment variable in the environment in which the solutions will be applied.
 6. (Optional) Navigate to solutions directory and execute Terraform commands for init of the backend and deployment of the resources included in the solution.

### Commands for deploying with Terraform

These commands are for deployment from your local environment. In most cases it is easiest to set up the storage account remote state before deploying resources through Terraform as a part of a CI/CD platform.

From the `solutions/remote-state` directory

```bash
terraform init
terraform plan -out=tfplan -var-file=terraform.tfvars -var "subscription_id=$SUBSCRIPTION_ID" -var "tenant_id=$TENANT_ID" -var "client_secret=$CLIENT_SECRET" -var "app_id=$APP_ID" -var "environment=$ENVIRONMENT" -var "storage_account_name=$STORAGE_ACCOUNT_NAME";
terraform apply tfplan;
```


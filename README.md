# Azure Landing Zone Template 
[![Build Status](https://dev.azure.com/Kuhlman-Labs/azure-landing-zone-template/_apis/build/status/brettkuhlman.azure-landing-zone-template?branchName=master)](https://dev.azure.com/Kuhlman-Labs/azure-landing-zone-template/_build/latest?definitionId=1&branchName=master)
[![Board Status](https://dev.azure.com/Kuhlman-Labs/040ac2ad-6e3c-4ed0-9fa7-9bd937d86ea0/dc26cefa-1675-4c37-bcca-b1ee83a15af2/_apis/work/boardbadge/0c1c1325-bfc5-4ade-81c7-98c1561e46fb)](https://dev.azure.com/kuhlman-labs/040ac2ad-6e3c-4ed0-9fa7-9bd937d86ea0/_boards/board/t/dc26cefa-1675-4c37-bcca-b1ee83a15af2/Microsoft.RequirementCategory)

## Purpose

This repository itself is meant to provide curated, reusable [Terraform](https://www.terraform.io/) content for the deployment of an Azure Cloud Landing Zone.

## Structure

There are dedicated `README.md` files in each directory, summarised links provided here for your convenience

* Solutions
    * [remote-state](solutions/remote-state/README.md)
    * [test](solutions/test/README.md)
    * [audit](solutions/audit/README.md)
    * [shared-services](solutions/shared-services/README.md)
    * [pre-prod](solutions/pre-prod/README.md)
    * [prod](solutions/prod/README.md)

* Infrastructure Modules
    * [key-vault-with-p2s-cert](infrastructure-modules/key-vault-with-p2s-cert/README.md)
    * [log-analytics](infrastructure-modules/log-analytics/README.md)
    * [network-hub](infrastructure-modules/network-hub/README.md)
    * [network-spoke](infrastructure-modules/network-spoke/README.md)

* Resource Modules
    * Governance
        * [key-vault](resource-modules/governance/key-vault/README.md)
        * [log-analytics](resource-modules/governance/log-analytics/README.md)
    * Network
        * [nsg](resource-modules/network/nsg/README.md)
        * [vnet](resource-modules/network/vnet/README.md)
        * [vnet-gateway](resource-modules/network/vnet-gateway/README.md)
        * [vnet-peering](resource-modules/network/vnet-peering/README.md)
        * [vnet-subnets](resource-modules/network/vnet-subnets/README.md)
    *  Resource Group
        *  [resource-group](resource-modules/resource-group/README.md)

## Launching

### Deployment prerequisites

#### Software Dependencies

The following items are necessary to deploy a solution using the [commands](#commands-for-deploying-with-terraform) listed in this README:

* terraform

#### Subscription(s)

The Landing Zone can be deployed to a single subscription or to a number of subscriptions defined per solution. The subscription is specified during solution application through the `SUBSCRIPTION_ID` environment variable that is passed into each terraform command. No code changes are necessary to deploy to a different number of subscriptions.

The [Service Principal](#service-principal) that is created must be scoped to the Subscription that the solution is deployed.

#### Environment Variables

Environment variables are used in the [Terraform Commands](#commands-for-deploying-with-terraform) for deployment of the solutions. The environment variables should be populated in the environment where the commands will be executed.

*  ACCESS_KEY
    *  The [Storage Account](#storage-account) access key that gives permission to Terraform to retrieve and update the tfstate files
*  ENVIRONMENT
    *  The environment in which the solution is being deployed (e.g. WEBAPP)
*  STORAGE_ACCOUNT_NAME
    *  The name of the [Storage Account](#storage-account) used to store the remote Terraform state
*  STATE_KEY
    *  This should be the name of the Terraform state file for the solution. It should follow the {*}.{solution}.tfstate structure. (e.g. webapp.audit.tfstate)
        *  Using the exact name of the solution directory (e.g. `prod`, `shared-services`) is required for cross state file access in some solutions (e.g. `prod`). Following a set syntax for cross solution state file access limits the number of inputs that need to be provided as the number of solutions increases. See `prod` solution `main.tf` for an example of how this syntax is leveraged for accessing the state file of a different solution.
*  SUBSCRIPTION_ID
    *  The ID of the target Subscription for the solution
*  TENANT_ID
    *  The tenant ID for the [Service Principal](#service-principal) used to deploy the solution
*  APP_ID
    *  The application ID associated to the [Service Principal](#service-principal) used to deploy the solution
*  CLIENT_SECRET
    *  The client secret used to authenticate the [Service Principal](#service-principal) used to deploy the solution
*  SHARED_SERVICES_SUBSCRIPTION_ID
    *  The ID of the Subscription that the shared-services solution is deployed. This is necessary for the VNet Peering between the spoke and hub vnets

#### Storage Account

Terraform maintains state files that allow for the execution of [Terraform commands](#commands-for-deploying-with-terraform) to have context of the environment that the commands are executed against. Using a remote location for state allows for higher redundancy and the ability for multiple users to access the state for a shared environment. The `azurerm` provider utilizes a storage account in Azure for this remote state storage. 

The storage account for remote state must be created and the related environment variables exported before the Terraform commands for a [solution](#solutions) can be executed.

The CLZ was created to work off of a single Azure storage account and container. The tfstate files are generated separately for each solution to limit the impact of changes to the only the solution being altered.

See README in /solutions/remote-state for automated creation of the storage account.

Steps to create:

*  Create new Storage Account
*  Create container named 'tfstate'
*  Retrieve access key and set `ACCESS_KEY` environment variable
*  Retrieve Storage Account name and set `STORAGE_ACCOUNT_NAME` environment variable

The individual state files for each solution will be created by the azurerm provider in this container.

#### Service Principal

A Service Principal is the entity in Azure Active Directory (AAD) that Terraform will use to manage resources based upon the permissions granted. Contributor permissions should be granted to the Service Principal for each Subscription that needs to be managed.

For the steps to create a Service Principal for an application registered in AAD see the following:

[Service Principal Configuration](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html#creating-a-service-principal-in-the-azure-portal)

##### Example Programmatic Creation

A sample command that will create a Service Principal with a contributor role on a Subscription:

```bash
az ad sp create-for-rbac -n="{SERVICE PRINCIPAL NAME}" --role="Contributor" --scopes="/subscriptions/{SUBSCRIPTION ID}"
```

This will return the values necessary for populating the `TENANT_ID`, `APP_ID`, and `CLIENT_SECRET` environment variables used in the terraform commands. 

Note: The `password` return value is populated into the `CLIENT_SECRET` environment variable.

### Solutions

The deployable resources are organized into solutions that are designed to solve a specific purpose. Detail on each of the solutions can be found in the README located in the solution directory.

##### Order of Deployment

The order in which the solutions should be deployed based upon interdependencies:

* (Optional) test
    * A minimal solution that helps confirm the backend configuration and authentication are properly configured
*  audit
    * Deploys log analytics for storage audit logs  
*  shared-services
    * Deploys hub network for hub and spoke model, other shared infrastructure
*  pre-prod
    * Deploys spoke network designated for pre-prod workloads
*  prod
    * Deploys spoke network designated for prod workloads

### Commands for Deploying with Terraform

These commands can be executed from your local environment, however, it is recommended that the commands be incorporated into a deployment pipeline in the CI/CD platform of your choice.

Commands are executed from the folder corresponding to the solution that you are deploying. These commands will need to be run for each solution that needs to be deployed.

Example: `/solutions/test`

```bash
terraform init -input=false -upgrade=true -backend=true -backend-config="access_key=$ACCESS_KEY" -backend-config="storage_account_name=$STORAGE_ACCOUNT_NAME" -backend-config="key=$STATE_KEY";
terraform plan -out=tfplan -var-file=terraform.tfvars -var "subscription_id=$SUBSCRIPTION_ID" -var "tenant_id=$TENANT_ID" -var "client_secret=$CLIENT_SECRET" -var "app_id=$APP_ID" -var "environment=$ENVIRONMENT" -var "storage_account_name=$STORAGE_ACCOUNT_NAME" -var "access_key=$ACCESS_KEY" -var "state_key=$STATE_KEY" -var "shared_services_subscription_id=$SHARED_SERVICES_SUBSCRIPTION_ID";
terraform apply tfplan;
```

To clean up the infrastructure created for a solution you can run the following in the solution directory:

```bash
terraform destroy -auto-approve -var-file=terraform.tfvars -var "subscription_id=$SUBSCRIPTION_ID" -var "tenant_id=$TENANT_ID" -var "client_secret=$CLIENT_SECRET" -var "app_id=$APP_ID" -var "environment=$ENVIRONMENT" -var "storage_account_name=$STORAGE_ACCOUNT_NAME" -var "access_key=$ACCESS_KEY" -var "state_key=$STATE_KEY" -var "shared_services_subscription_id=$SHARED_SERVICES_SUBSCRIPTION_ID";
```

### Lab Deployment

The solution can be deployed to a lab subscription by creating a [Service Principal](#service-principal) in the lab and setting the `SUBSCRIPTION_ID` environment variable to the ID of the lab you have been provisioned. No code changes are necessary to deploy to the lab.

### Solution
* Definition: The top level composition that deploys all resources necessary for a single environment. Each solution is composed of one or more Infrastructure Modules.
* Extending:
    * An Existing Solution
         * An existing solution can be extended by referencing additional Infrastructure Modules.
    * Creating a New Solution
         * To create a new solution a new directory should be created with the standard files (`main.tf, outputs.tf, providers.tf, terraform.tfvars, variables.tf, README-head.md, README.md`). Inside the `main.tf` the required Infrastructure Module(s) should be called. If new modules need to be created the instructions for Infrastructure Modules should be consulted.

### Infrastructure Module
* Definition: Composes a logical portion of infrastructure by composing one or more Resource Modules.
* Extending:
    * An Existing Infrastructure Module
        * Adding additional resources can be accomplished by referencing additional Resource Modules
    * Create a New Infrastructure Module
        * To create a new Infrastructure Module a new directory should be created in a child folder of the infrastructure-modules directory with the standard files (`main.tf, outputs.tf, variables.tf, README-head.md, README.md`). Inside the `main.tf` the required Resource Module(s) should be called. If new modules need to be created the instructions for Resource Modules should be consulted.

### Resource Module
* Defintion: Represents, in most cases, the deployment of a single resource.
* Extending:
    * An Existing Resource Module
        * Adjusting existing Resource Modules should be kept to a minimum because they are not currently being versioned.
    * Create a New Resource Module
        * To create a new Resource Module a new directory should be created in a child folder of the resource-modules directory with the standard files (`main.tf, outputs.tf, variables.tf, README-head.md, README.md`). It is recommended that a single resource is created in the `main.tf` to keep the module simple and reuseable. 

### File Definitions
* main.tf
    * Contains the reference to the terraform modules and resources in scope for the solution or module.
* outputs.tf
    * Defines any outputs of the solution or module.
* providers.tf
    * Takes in the remote state credential information and sets up the azurerm backend. The Terraform and azurerm versions are defined in this file as well.
* variables.tf
    * Defines the input variables for the solution or module. All variables should have a type and description defined.
* README-head.md
    * Defines the manually created header information (`Description, Resource Created`) for the README file that will be combined with the automatically generated terraform-docs content.
* README.md
    * Contains the contents of README-head.md combined with the output from the terraform-docs command `(cat README-head.md; terraform-docs --no-sort md ./) > README.md` which generates a table of the inputs and outputs specified in the current directory.

### Adjusting Naming Conventions

The naming conventions are established in the resource modules, including the Resource Group module that builds out the name based upon variable inputs to the calling solution.

## FAQs

### How do I request new materials?

Please create an issue.

## Nota Bene

It is highly likely that this documentation has room for improvement. If you
find issues, please don't hesitate to create an issue.

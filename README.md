# Azure Terraform Service Catalog

## Purpose

This repository itself is meant to provide curated, reusable [Terraform](https://www.terraform.io/) content for the deployment of an [Azure Landing Zone](https://docs.microsoft.com/en-us/azure/architecture/cloud-adoption/ready/considerations/).

Landing zones are the basic building blocks of any cloud adoption environment. The term landing zone is used to describe an environment that has been provisioned and prepared to host workloads in a cloud environment, such as Azure. A fully functioning landing zone is the final deliverable of any iteration of the Cloud Adoption Framework's Ready methodology.

## Deployment

### Deployment prerequisites

#### Software Dependencies

The following items are necessary to deploy a environments using the [commands](#commands-for-deploying-with-terraform) listed in this README:

* [terraform](https://www.terraform.io/downloads.html)
* [azure-cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

The [Dockerfile](Dockerfile) in this repository can be used to build a container with all neccesary prerequisites.

#### Subscription(s)

The Landing Zone can be deployed to a single subscription or to a number of subscriptions defined per environments. The subscription is specified during environments application through the `SUBSCRIPTION_ID` environment variable that is passed into each terraform command. No code changes are necessary to deploy to a different number of subscriptions.

The [Service Principal](#service-principal) that is created must be scoped to the Subscription that the environments is deployed.

#### Environment Variables

Environment variables are used in the [Terraform Commands](#commands-for-deploying-with-terraform) for deployment of the environments. The environment variables should be populated in the environment where the commands will be executed.

*  ACCESS_KEY
    *  The [Storage Account](#remote-state) access key that gives permission to Terraform to retrieve and update the tfstate files
*  STORAGE_ACCOUNT_NAME
    *  The name of the [Storage Account](#remote-state) used to store the remote Terraform state
*  STATE_KEY
    *  This should be the name of the Terraform state file for the environment. It should follow the {*}.{environments}.tfstate structure. (e.g. webapp.audit.tfstate)
        *  Using the exact name of the environments directory (e.g. `prod`, `shared-services`) is required for cross state file access in some environments (e.g. `prod`). Following a set syntax for cross environments state file access limits the number of inputs that need to be provided as the number of environments increases. See `prod` environments `main.tf` for an example of how this syntax is leveraged for accessing the state file of a different environments.
*  SUBSCRIPTION_ID
    *  The ID of the target Subscription for the environments
*  TENANT_ID
    *  The tenant ID for the [Service Principal](#service-principal) used to deploy the environments
*  APP_ID
    *  The application ID associated to the [Service Principal](#service-principal) used to deploy the environments
*  CLIENT_SECRET
    *  The client secret used to authenticate the [Service Principal](#service-principal) used to deploy the environments
*  SHARED_SERVICES_SUBSCRIPTION_ID
    *  The ID of the Subscription that the shared-services environments is deployed. This is necessary for the VNet Peering between the spoke and hub vnets

#### Remote-State

Terraform maintains state files that allow for the execution of [Terraform commands](#commands-for-deploying-with-terraform) to have context of the environment that the commands are executed against. Using a remote location for state allows for higher redundancy and the ability for multiple users to access the state for a shared  environment. The `azurerm` provider utilizes a storage account in Azure for this remote state storage. 

The storage account for remote state must be created and the related environment variables exported before the Terraform commands for a [modules](#modules) can be executed.

The Landing Zone was created to work off of a single Azure storage account and container. The tfstate files are generated separately for each environments to limit the impact of changes to the only the environments being altered.

See README in /environments/remote-state for automated creation of the storage account.

Steps to create:

*  Create new Storage Account
*  Create container named 'tfstate'
*  Retrieve access key and set `ACCESS_KEY` environment variable
*  Retrieve Storage Account name and set `STORAGE_ACCOUNT_NAME` environment variable

The individual state files for each environment will be created by the azurerm provider in this container.

#### Service Principal

A Service Principal is the entity in Azure Active Directory (AAD) that Terraform will use to manage resources based upon the permissions granted. Contributor permissions should be granted to the Service Principal for each Subscription that needs to be managed.

For the steps to create a Service Principal for an application registered in AAD see the following:

[Service Principal Configuration](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html#creating-a-service-principal-in-the-azure-portal)


### Environments

The deployable resources are organized into environments that are designed to solve a specific purpose. Detail on each of the environments can be found in the README located in the environments directory.

##### Order of Deployment

The order in which the environments should be deployed based upon interdependencies:

*  audit
    * Deploys log analytics for storage audit logs  
*  shared-services
    * Deploys hub network for hub and spoke model, other shared infrastructure
*  dev
    * Deploys spoke network designated for dev workloads
*  prod
    * Deploys spoke network designated for prod workloads
* (Optional) test
    * A validation environment that helps confirm the modules are properly configured    

### Commands for Deploying with Terraform

These commands can be executed from your local environment, however, it is recommended that the commands be incorporated into a deployment pipeline in the CI/CD platform of your choice.

Commands are executed from the folder corresponding to the environments that you are deploying. These commands will need to be run for each environments that needs to be deployed.

Example: `/environments/test`

```bash
terraform init -input=false -upgrade=true -backend=true -backend-config="access_key=$ACCESS_KEY" -backend-config="storage_account_name=$STORAGE_ACCOUNT_NAME" -backend-config="key=$STATE_KEY";
terraform plan -out=tfplan -var-file=terraform.tfvars -var "subscription_id=$SUBSCRIPTION_ID" -var "tenant_id=$TENANT_ID" -var "client_secret=$CLIENT_SECRET" -var "app_id=$APP_ID"  -var "storage_account_name=$STORAGE_ACCOUNT_NAME" -var "access_key=$ACCESS_KEY" -var "state_key=$STATE_KEY" -var "shared_services_subscription_id=$SHARED_SERVICES_SUBSCRIPTION_ID";
terraform apply tfplan;
```

To clean up the infrastructure created for a environments you can run the following in the environments directory:

```bash
terraform destroy -auto-approve -var-file=terraform.tfvars -var "subscription_id=$SUBSCRIPTION_ID" -var "tenant_id=$TENANT_ID" -var "client_secret=$CLIENT_SECRET" -var "app_id=$APP_ID"  -var "storage_account_name=$STORAGE_ACCOUNT_NAME" -var "access_key=$ACCESS_KEY" -var "state_key=$STATE_KEY" -var "shared_services_subscription_id=$SHARED_SERVICES_SUBSCRIPTION_ID";
```

### environments
* Definition: The top level composition that deploys all resources necessary for a single environment. Each environment is composed of one or more modules.
* Extending:
    * An Existing environment
         * An existing environment can be extended by referencing additional Modules.
    * Creating a New environments
         * To create a new environment a new directory should be created with the standard files (`main.tf, outputs.tf, providers.tf, terraform.tfvars, variables.tf, README.md`). Inside the `main.tf` the required Module(s) should be called. If new modules need to be created the instructions for Modules should be consulted.

### modules
* Definition: Composes a logical portion of infrastructure by composing one or more resources.
* Extending:
    * An Existing Module
        * Adding additional resources can be accomplished by referencing additional Resources
    * Create a New Module
        * To create a new Module a new directory should be created in a child folder of the modules directory with the standard files (`main.tf, outputs.tf, variables.tf, README.md`). Inside the `main.tf` the required Resource(s) should be called. If new modules need to be created the instructions for Resources should be consulted.

### resources
* Defintion: Represents, in most cases, the deployment of a single resource.
* Extending:
    * An Existing Resource
        * Adjusting existing Resources should be kept to a minimum because they are not currently being versioned.
    * Create a New Resource
        * To create a new Resource a new directory should be created in a child folder of the resource directory with the standard files (`main.tf, outputs.tf, variables.tf, README.md`). It is recommended that a single resource is created in the `main.tf` to keep the module simple and reuseable. 

### File Definitions
* main.tf
    * Contains the reference to the terraform modules and resources in scope for the environments or module.
* outputs.tf
    * Defines any outputs of the environments or module.
* providers.tf
    * Takes in the remote state credential information and sets up the azurerm backend. The Terraform and azurerm versions are defined in this file as well.
* variables.tf
    * Defines the input variables for the environments or module. All variables should have a type and description defined.
* README.md
    * Contains the contents the output from the terraform-docs command `(terraform-docs md ./) > README.md` which generates a table of the inputs and outputs specified in the current directory.

### Adjusting Naming Conventions

The naming conventions are established in the Resources that builds out the name based upon variable inputs to the calling environments.

## FAQs


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

### How do I request new modules?

Please create an issue.

## Nota Bene

It is highly likely that this documentation has room for improvement. If you
find issues, please don't hesitate to create an issue.

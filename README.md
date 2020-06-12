![Terraform CI/CD](https://github.com/kuhlman-labs/azure-terraform-service-catalog/workflows/Terraform%20CI/CD/badge.svg)

# Terraform AzureRM Landing Zone

## Purpose

This repository is meant to provide a curated collection of [Terraform](https://www.terraform.io/)  `azurerm` modules. These modules were designed to be able to build off each other, allowing a user to quickly build out an [Azure Landing Zone](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/)

## How to use

### Prerequisites

#### Software Dependencies

The following items are necessary to deploy a environments using the [commands](#commands-for-deploying-with-terraform) listed in this README:

* [terraform](https://www.terraform.io/downloads.html)
* [azure-cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)

The [Dockerfile](Dockerfile) in this repository can be used to build a container with all neccesary prerequisites.

#### Remote-State

Terraform maintains state files that allow for the execution of Terraform commands to have context of the environment that the commands are executed against. Using a remote location for state allows for higher redundancy and the ability for multiple users to access the state for a shared environment. This repository is set up to use the [azurerm backend](https://www.terraform.io/docs/backends/types/azurerm.html) type.

The repository was created to work off of a single Azure storage account and container. The tfstate files are generated separately for each environment to limit the impact of changes to the only the environment being altered. The test environment is designed not to use a backend to be able to quickly test your module compositions.

Steps to create:

*  Create new Storage Account
*  Create container named 'tfstate'
*  Update the vaules for the `resource_group_name`, `storage_account_name`, `container_name`, and `key` the providers.tf file for each environment.

The individual state files for each environment will be created by the azurerm provider in this container.

#### Service Principal

Creating a Service principal is neccesary to run `terrafom` in automation workflows. A Service Principal is the entity in Azure Active Directory (AAD) that `terraform` will use to manage resources based upon the permissions granted. `Owner` permissions should be granted to the Service Principal for each Subscription that needs to be managed.

For the steps to create a Service Principal for an application registered in AAD see the following:

* [Service Principal Configuration](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html#creating-a-service-principal-in-the-azure-portal)


### Running Terraform locally

These commands are used to execute Terraform deployments from your local environment, commands are executed from the folder corresponding to the environment that you are deploying. These commands will need to be run for each environment that needs to be deployed.

Example: `/environments/test`

```bash
az login
terraform init
terraform plan -out=tfplan;
terraform apply tfplan;
```

To clean up the infrastructure created for an environment you can run the following in the environment directory:

Example: `/environments/test`

```bash
terraform destroy -auto-approve 
```

##### Order of Deployment

The order in which the environments should be deployed based upon interdependencies:

*  shared-services
    * Typically used to deploy a hub network for hub and spoke model, and other shared infrastructure
*  dev
    * Typically used to deploy a spoke network and designated development workloads
*  prod
    * Typically used to deploy a spoke network and designated production workloads

## Directory Structure

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
    * Takes in the remote state credential information and sets up the azurerm backend. The `terraform`,  `azurerm` and any other provider versions are defined in this file as well.
* variables.tf
    * Defines the input variables for the environments or module. All variables should have a type and description defined.
* README.md
    * Contains the contents the output from the terraform-docs command `(terraform-docs md ./) > README.md` which generates a table of the inputs and outputs specified in the current directory.

## FAQs

#### How do I adjust the naming conventions?

The naming conventions are established in the resource defnition that will build out the name based upon variable inputs from the calling environments.

#### How do I request new modules?

Please create an issue.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
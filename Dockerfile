# Azure Pipelines container requirements
# https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases?view=azure-devops&tabs=yaml#requirements

FROM ubuntu:1604

# Here we install Terraform

ENV TERRAFORM_VERSION=0.12.2

RUN \
  sudo apt-get install unzip && \
  wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  unzip ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  sudo mv terraform /usr/local/bin && \
  rm ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \    
  sudo apt-get uninstall zip

# Here we install Azure CLI

RUN \
  sudo apt-get install curl && \
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash && \
  sudo apt-get uninstall curl
# Azure Pipelines container requirements
# https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases?view=azure-devops&tabs=yaml#requirements

FROM ubuntu:16.04

# Here we install Terraform

ENV TERRAFORM_VERSION=0.12.2

RUN \
  apt-get install unzip && \
  wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  unzip ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  mv terraform /usr/local/bin && \
  rm ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \    
  apt-get uninstall zip

# Here we install Azure CLI

RUN \
  apt-get install curl && \
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash && \
  apt-get uninstall curl
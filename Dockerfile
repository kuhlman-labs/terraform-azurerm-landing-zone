# Azure Pipelines container requirements
# https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases?view=azure-devops&tabs=yaml#requirements
FROM ubuntu:16.04

# Update Software repository
RUN apt-get update
 
# Install unzip, curl
RUN apt-get install -y unzip curl wget bash && \
    rm -rf /var/lib/apt/lists/*

# Install Terraform
ENV TERRAFORM_VERSION=0.12.2    

RUN \
  wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  mv terraform /usr/local/bin && \
  rm ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Install Azure CLI
RUN \
  curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Uninstall unzip, curl
RUN apt-get remove -y unzip curl wget
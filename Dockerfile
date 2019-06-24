# Azure Pipelines container requirements
# https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases?view=azure-devops&tabs=yaml#requirements
FROM ubuntu:16.04

ENV TERRAFORM_VERSION=0.12.2 


RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip curl wget bash git && \
    rm -rf /var/lib/apt/lists/* && \
    wget --no-check-certificate https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin && \
    rm ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
apt-get remove -y unzip curl wget
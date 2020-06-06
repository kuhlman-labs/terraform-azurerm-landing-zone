FROM ubuntu:latest

ENV TERRAFORM_VERSION=0.12.26


RUN apt-get update && \
    apt-get install -y unzip curl wget bash git && \
    rm -rf /var/lib/apt/lists/* && \
    wget --no-check-certificate https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin && \
    rm ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    az aks install-cli && \
    apt-get remove -y unzip curl wget

#!/bin/bash

# Download Terraform. URI: https://www.terraform.io/downloads.html
echo "Downloading https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip."
curl -o terraform.zip https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip
# Unzip and install
unzip terraform.zip
sudo mv terraform /usr/local/bin/
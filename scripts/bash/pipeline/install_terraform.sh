#!/bin/bash

# Download Terraform. URI: https://www.terraform.io/downloads.html
echo "Downloading https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip."
curl -o terraform.zip https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
# Unzip and install
unzip terraform.zip
sudo mv terraform /usr/local/bin/
#!/bin/sh

solutions="solutions/audit/ solutions/shared-services/ solutions/pre-prod/ solutions/prod/"

for dir in ${solutions}; do
  cd "$dir";
  if [ -f terraform.tfvars ]; 
  then
    terraform init -input=false -upgrade=true -backend=true -backend-config="access_key=$ACCESS_KEY" -backend-config="storage_account_name=$STORAGE_ACCOUNT_NAME" -backend-config="key=$STATE_KEY" -var "storage_account_name=$STORAGE_ACCOUNT_NAME" -var "access_key=$ACCESS_KEY" -var "state_key=$STATE_KEY";
    terraform validate -check-variables=false;
  fi;
  cd -;
done
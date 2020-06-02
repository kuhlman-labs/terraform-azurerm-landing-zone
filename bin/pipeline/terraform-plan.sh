#!/bin/sh
set -e

environments="environments/audit/ environments/shared-services/ environments/dev/ environments/prod/ environments/test/"

for dir in ${environments}; do
  cd "$dir";
  if [ -f terraform.tfvars ]; 
  then
    environment=$(echo ${dir#environments/});
    echo $environment;
    solution=${environment%/};
    echo $environment;
    export STATE_KEY="$environment.tfstate";
    echo $STATE_KEY;
    
    terraform init -input=false -upgrade=true -backend=true -backend-config="access_key=$ACCESS_KEY" -backend-config="storage_account_name=$STORAGE_ACCOUNT_NAME" -backend-config="key=$STATE_KEY" -var "storage_account_name=$STORAGE_ACCOUNT_NAME" -var "access_key=$ACCESS_KEY" -var "state_key=$STATE_KEY";
    terraform plan -out=tfplan -var-file=terraform.tfvars -var "subscription_id=$SUBSCRIPTION_ID" -var "tenant_id=$TENANT_ID" -var "client_secret=$CLIENT_SECRET" -var "app_id=$APP_ID" -var "storage_account_name=$STORAGE_ACCOUNT_NAME" -var "access_key=$ACCESS_KEY" -var "state_key=$STATE_KEY" -var "shared_services_subscription_id=$SHARED_SERVICES_SUBSCRIPTION_ID";
  fi;
  cd -;
done
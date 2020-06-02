#!/bin/sh
set -e

environments="environments/prod/ environments/pre-prod/ environments/audit/ environments/test/ environments/shared-services/"

for dir in ${environments}; do
  cd "$dir";
  if [ -f terraform.tfvars ]; 
  then
    git_branch=$(git rev-parse --abbrev-ref HEAD);
    echo $git_branch;
    formatted_branch=$(echo ${git_branch#feature/} | tr '[:upper:]' '[:lower:]');
    echo $formatted_branch;
    export ENVIRONMENT=$formatted_branch;
    echo $dir;
    solution=$(echo ${dir#environments/});
    echo $solution;
    solution=${solution%/};
    echo $solution;
    export STATE_KEY="$formatted_branch.$solution.tfstate";
    echo $STATE_KEY;
    
    terraform init -input=false -upgrade=true -backend=true -backend-config="access_key=$ACCESS_KEY" -backend-config="storage_account_name=$STORAGE_ACCOUNT_NAME" -backend-config="key=$STATE_KEY";
    terraform destroy -auto-approve -var-file=terraform.tfvars -var "subscription_id=$SUBSCRIPTION_ID" -var "tenant_id=$TENANT_ID" -var "client_secret=$CLIENT_SECRET" -var "app_id=$APP_ID" -var "storage_account_name=$STORAGE_ACCOUNT_NAME" -var "access_key=$ACCESS_KEY" -var "state_key=$STATE_KEY" -var "shared_services_subscription_id=$SHARED_SERVICES_SUBSCRIPTION_ID";
  fi;
  cd -;
done
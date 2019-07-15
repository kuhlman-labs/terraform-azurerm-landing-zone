#!/bin/sh
set -e

solutions="solutions/audit/ solutions/shared-services/ solutions/pre-prod/ solutions/prod/"

for dir in ${solutions}; do
  cd "$dir";
  if [ -f terraform.tfvars ]; 
  then
    git_branch=$(git rev-parse --abbrev-ref HEAD);
    echo $git_branch;
    formatted_branch=$(echo ${git_branch#feature/} | tr '[:upper:]' '[:lower:]');
    echo $formatted_branch;
    export ENVIRONMENT=$formatted_branch;
    echo $dir;
    solution=$(echo ${dir#solutions/});
    echo $solution;
    solution=${solution%/};
    echo $solution;
    export STATE_KEY="$formatted_branch.$solution.tfstate";
    echo $STATE_KEY;
    terraform init -input=false -upgrade=true -backend=true -backend-config="access_key=$ACCESS_KEY" -backend-config="storage_account_name=$STORAGE_ACCOUNT_NAME" -backend-config="key=$STATE_KEY" -var "storage_account_name=$STORAGE_ACCOUNT_NAME" -var "access_key=$ACCESS_KEY" -var "state_key=$STATE_KEY";
    terraform validate -check-variables=false;
    echo "Validation Completed";
  fi;
  cd -;
done
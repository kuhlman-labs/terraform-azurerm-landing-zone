#!/bin/sh
set -e

modules="environments/* modules/* resources/*"

for dir in $(find ${modules} -maxdepth 2 -type d); do
  cd "$dir";
  if [ -f main.tf ]; 
  then
    terraform init -input=false -upgrade=true -backend=false;
    terraform validate;
    echo "Validation Completed";
  fi;
  cd -;
done
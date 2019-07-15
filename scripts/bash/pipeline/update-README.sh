#!/bin/sh
set -e

modules="solutions/* infrastructure-modules/* resource-modules/*"

for dir in $(find ${modules} -maxdepth 2 -type d); do
  cd "$dir";
  if [ -f main.tf ]; 
  then
    echo "$dir/";
    echo | terraform-config-inspect  > README.md
  fi;
  cd -;
done
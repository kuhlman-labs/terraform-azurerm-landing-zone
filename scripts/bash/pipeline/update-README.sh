#!/bin/sh
set -e

solutions="solutions/* infrastructure-modules/* resource-modules/*"

for dir in ${solutions}; do
  cd "$dir";
  if [ -f main.tf ]; 
  then
    echo "$dir/";
    echo | terraform-config-inspect  > README.md
  fi;
  cd -;
done
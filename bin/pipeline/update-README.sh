#!/bin/sh
set -e

modules="environments/* modules/* resources/*"

for dir in $(find ${modules} -type d); do
  cd "$dir/";
  if [ -f main.tf ]; 
  then
    cd -;
    echo "$dir";
    echo | terraform-docs md "$dir"  > "$dir/"README.md
  else
  cd -;
  echo skipping $dir, because it does not contain a terraform module
  fi;
done
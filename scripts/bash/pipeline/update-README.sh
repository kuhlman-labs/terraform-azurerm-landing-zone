#!/bin/sh
set -e

modules="solutions/* infrastructure-modules/* resource-modules/*"

for dir in $(find ${modules} -maxdepth 1 -type d); do
  cd "$dir/";
  if [ -f main.tf ]; 
  then
    cd -;
    echo "$dir";
    echo | terraform-config-inspect "$dir"  > "$dir/"README.md
  else
  cd -;
  echo skipping $dir, not a module directory
  fi;
done
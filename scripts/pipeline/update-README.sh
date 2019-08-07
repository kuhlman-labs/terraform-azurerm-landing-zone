#!/bin/sh
set -e

modules="environments/* modules/* resources/*"

for dir in $(find ${modules} -maxdepth 3 -type d); do
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

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT
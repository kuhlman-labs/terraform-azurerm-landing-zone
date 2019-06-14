#!/bin/sh

for dir in solutions/*/; do
    cd "$dir";
    terraform validate --check-variables=false
    cd -;
done

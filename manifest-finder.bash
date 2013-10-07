#!/bin/bash

echo "This script will test wether or not a site declares a cache manifest."
for address in $(cat alexa.sites); do
    echo "Testing $address"
  if wget -q -O- "$address" | grep -e "manifest" > /dev/null 2>&1; then
    echo "$address har ett cache manifest!"
  fi
done

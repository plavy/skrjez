#!/bin/bash

dir="$1"
pat="$2"

if [[ ! -d "$dir" || -z $pat ]]; then
  echo "Please provide directory to search, and name pattern."
  exit 1
fi

echo "Searching $dir for $pat"

c=0
IFS=$'\n'
for file in $(find $dir -type f -name "$pat"); do
  add=$(wc -l $file | awk '{print $1}')
  c=$((c + add))
done
unset IFS

echo "Found $c lines in matching files."

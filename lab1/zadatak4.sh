#!/bin/bash

dir="$1"

if [[ ! -d "$dir" ]]; then
  echo "Please provide directory with photos."
  exit 1
fi

for date in $(ls $dir | awk '{print substr($0,1,6)}' | sort -u); do
  echo -e "\n${date:4:2}-${date:0:4} :"
  echo "----------"
  i=1
  for file in $(ls $dir | grep "^$date"); do
    echo "   $i. $file"
    i=$(($i + 1))
  done
  echo "--- Ukupno: $((i - 1)) slika -----"

done

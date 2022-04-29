#!/bin/bash

dir="$1"
len="$2"

if [[ ! -d "$dir" ]]; then
  echo "Please provide directory with files to show."
  exit 1
fi

len=${len:-6}

for file in $(ls $dir); do
  if [ -f ${dir}/${file} ]; then
    echo -e "\n"
    echo "Ime skripte: ${file}"
    echo "-----------------------------"
    head -n ${len} ${dir}/${file}
  fi
done

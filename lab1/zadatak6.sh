#!/bin/bash

dir1="${1%/}"
dir2="${2%/}"

if [[ ! -d "$dir1" || ! -d "$dir2" ]]; then
  echo "Please provide directory 1, and directory 2."
  exit 1
fi

for file in $(ls $dir1); do
  if [ $dir1/$file -nt $dir2/$file ]; then
    echo "$dir1/$file --> $dir2"
  fi
done

for file in $(ls $dir2); do
  if [ $dir2/$file -nt $dir1/$file ]; then
    echo "$dir2/$file --> $dir1"
  fi
done

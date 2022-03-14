#!/bin/bash

dir="$1"

if [[ ! -d "$dir" ]]; then
  echo "Please provide directory with logs."
  exit 1
fi

for file in $(ls -d $dir/* | grep "\-02\-"); do

  echo -ne "\ndatum: "
  echo "$file" | awk -F/ '{print $NF}' | sed -E 's/.*\.([0-9]{4})-([0-9]{2})-([0-9]{2}).*/\3-\2-\1/g'
  echo "--------------------------------------------------"

  cat "$file" | awk -F'"' '{print $2}' > ${file}.actions

  sort -u ${file}.actions > ${file}.uniq

  IFS=$'\n'
  for line in $(cat ${file}.uniq); do
    echo -n "  $(grep -c "$line" ${file})" >> ${file}.count
    echo " : $line" >> ${file}.count
  done
  unset IFS

  sort -nrk1 ${file}.count > ${file}.sorted

  cat ${file}.sorted

  rm ${file}.{actions,uniq,count,sorted}

done

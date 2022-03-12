#!/bin/bash

dir=$1

if [[ ! -d "$dir" ]]; then
  echo "Please provide directory with logs."
  exit 1
fi

#!/usr/bin/env bash

url="https://api.themoviedb.org"

if [ -z "$1" ]; then
  echo "ID not provided."
  exit 1
else
  curl \
    -s "$url/3/person/$1?api_key=$API_KEY"
fi

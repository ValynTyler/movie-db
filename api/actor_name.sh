#!/usr/bin/env bash

if [ -z "$API_KEY" ]; then
  echo "API key not found."
  exit 1
elif [ -z "$1" ]; then
  echo "ID not provided."
  exit 1
else
  curl \
    -s "$URL/3/person/$1?api_key=$API_KEY"
fi

#!/usr/bin/env bash

url="https://api.themoviedb.org"

if [ -z "$API_KEY" ]; then
  echo "API key not found."
  exit 1
else
  curl \
    -X GET "$url/3/person/popular?api_key=$API_KEY" \
    -H "Accept: application/json"
fi

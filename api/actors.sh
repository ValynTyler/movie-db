#!/usr/bin/env bash

if [ -z "$API_KEY" ]; then
  echo "API key not found."
  exit 1
else
  curl \
    -s \
    -X GET "$URL/3/person/popular?api_key=$API_KEY" \
    -H "Accept: application/json"
fi

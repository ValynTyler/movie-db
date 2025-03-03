#!/usr/bin/env bash

get_api_key() {
  if [ -z "$API_KEY" ]; then
    read -p "Please specify your API key: " API_KEY
    echo $(get_api_key)
  else
    echo $API_KEY
  fi
}

if ! grep -q "^API_KEY=" ".env"; then
  echo "API_KEY=$(get_api_key)" >> .env
  echo "API key successfully set!"
else
  echo "API key already set."
fi

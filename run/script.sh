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
fi

get_actors() {
  curl \
    -X GET "https://api.themoviedb.org/3/person/popular?api_key=$API_KEY" \
    -H "Accept: application/json" \
    | jq -r '.results[].name'
}

get_actors | while read actor; do
  echo "$actor is an actor."
done

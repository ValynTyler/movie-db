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

get_actor_ids() {
  curl \
    -X GET "https://api.themoviedb.org/3/person/popular?api_key=$API_KEY" \
    -H "Accept: application/json" \
    | jq -r '.results[].id'
}

get_name_by_id() {
  curl -s "https://api.themoviedb.org/3/person/$1?api_key=$API_KEY" | jq -r '.name'
}

get_latest_movie() {
  curl \
    -s "https://api.themoviedb.org/3/person/$1/movie_credits?api_key=$API_KEY" \
    | jq -r '.cast | sort_by(.release_date) | last(.[]) | .title'
}

get_actor_ids | while read id; do
  name=$(get_name_by_id $id)
  movie=$(get_latest_movie $id)

  echo "$name was most recently in $movie."
done

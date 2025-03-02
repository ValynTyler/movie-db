#!/usr/bin/env bash


./api/actors.sh \
| jq -r '.results[].id' \
| while read id; do
  ./api/actor_movies.sh $id \
    | jq -r '.cast 
      | sort_by(.release_date)
      | reverse[0]
      | "\(.release_date): \(.title)"'
done

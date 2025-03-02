#!/usr/bin/env bash

id=64

./api/actor_movies.sh $id \
  | jq -r '.cast 
    | sort_by(.release_date)
    | reverse[0]
    | "This actor'\''s latest movie is \(.title)"' \
  | bat

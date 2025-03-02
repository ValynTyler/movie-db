#!/usr/bin/env bash


./api/actors.sh \
| jq -r '.results[].id' \
| while read id; do
  movie=$(./api/actor_movies.sh $id \
    | jq -r '.cast 
      | sort_by(.release_date)
      | reverse[0]
      | .title')

  actor=$(./api/actor.sh $id \
    | jq -r '.name')

  echo -e "This actor most recenetly appeared in the following movie:\n$actor\n$movie\n"
done

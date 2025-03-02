init:
  @ sqlite3 movies.db < sql/schema.sql

display_actor_ids:
  @ ./api/actors.sh | jq -r '.results[].id' | bat

display_actor_names:
  @ ./api/actors.sh | jq -r '.results[].name' | bat

display_actor_ids_names:
  @ ./api/actors.sh
    | jq -r '.results[] | "\(.id): \(.name)"'
    | bat

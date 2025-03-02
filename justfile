init:
  @ sqlite3 movies.db < sql/schema.sql

display_actor_names:
  @ ./api/actors.sh | jq -r '.results[].name' | bat
